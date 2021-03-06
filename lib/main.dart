import 'dart:convert';

import 'package:benzapp_flutter/app_debug.dart';
import 'package:benzapp_flutter/repositories/impl/account_repository_impl.dart';
import 'package:benzapp_flutter/repositories/impl/application_info_repository_impl.dart';
import 'package:benzapp_flutter/repositories/impl/notification_repository_impl.dart';
import 'package:benzapp_flutter/repositories/impl/refueling_repository_impl.dart';
import 'package:benzapp_flutter/repositories/impl/stations_repository_impl.dart';
import 'package:benzapp_flutter/repositories/impl/vehicle_repository_impl.dart';
import 'package:benzapp_flutter/repositories/model/notification.dart'
    as app_notification;
import 'package:benzapp_flutter/repositories/model/station.dart';
import 'package:benzapp_flutter/repositories/network/api_client.dart';
import 'package:benzapp_flutter/repositories/network/model/admin_user_dto.dart';
import 'package:benzapp_flutter/repositories/notification_repository.dart';
import 'package:benzapp_flutter/repositories/persistence/app_database.dart';
import 'package:benzapp_flutter/repositories/persistence/secure_repository.dart';
import 'package:benzapp_flutter/repositories/refueling_repository.dart';
import 'package:benzapp_flutter/repositories/stations_repository.dart';
import 'package:benzapp_flutter/ui/home/home_view_model.dart';
import 'package:benzapp_flutter/ui/lock/lock_screen.dart';
import 'package:benzapp_flutter/ui/lock/lock_view_model.dart';
import 'package:benzapp_flutter/ui/login/login_screen.dart';
import 'package:benzapp_flutter/ui/main/main_screen.dart';
import 'package:benzapp_flutter/ui/qrcode/qrcode_screen.dart';
import 'package:benzapp_flutter/ui/refuelings/refueling_detail_screen.dart';
import 'package:benzapp_flutter/ui/refuelings/refueling_list_screen.dart';
import 'package:benzapp_flutter/ui/refuelings/refueling_view_model.dart';
import 'package:benzapp_flutter/ui/stations/station_view_model.dart';
import 'package:benzapp_flutter/ui/vehicles/vehicle_detail_screen.dart';
import 'package:benzapp_flutter/ui/vehicles/vehicle_list_screen.dart';
import 'package:benzapp_flutter/ui/vehicles/vehicle_view_model.dart';
import 'package:benzapp_flutter/ui/widgets/please_wait_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:floor/floor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'fcm_handler.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  late StationsViewModel _stationsViewModel;

  late VehicleViewModel _vehicleViewModel;

  late RefuelingViewModel _refuelingViewModel;

  late LockViewModel _lockViewModel;

  late HomeViewModel _homeViewModel;

  late String _initialRouteName;

  int notificationSemaphore = 0;

  Future<bool> _applicationInit() async {
    try {
      final Callback callback =
          Callback(onCreate: (sqflite.Database database, int version) async {
        final String value = await DefaultAssetBundle.of(context)
            .loadString("assets/json/stations.json");

        for (final dynamic item in jsonDecode(value) as List<dynamic>) {
          database.insert("stations", Station.fixJsonForDatabase(item));
        }
      });

      final AppDatabase database = await $FloorAppDatabase
          .databaseBuilder('app_database.db')
          .addCallback(callback)
          .build();

      final ApiClient restClient = ApiClient();

      final AccountRepositoryImpl accountRepository =
          AccountRepositoryImpl(database, restClient);
      final VehicleRepositoryImpl vehicleRepository =
          VehicleRepositoryImpl(database, restClient);
      final RefuelingRepository refuelingRepository =
          RefuelingRepositoryImpl(database, restClient);
      final StationsRepository stationsRepository =
          StationsRepositoryImpl(database);
      final NotificationRepository notificationRepository =
          NotificationRepositoryImpl(database);

      final SecureRepository secureRepository = SecureRepository();
      final ApplicationInfoRepositoryImpl applicationInfoRepository =
          ApplicationInfoRepositoryImpl();

      await accountRepository.refreshRemoteConfig();
      await applicationInfoRepository.init();

      _vehicleViewModel = VehicleViewModel(vehicleRepository);
      _refuelingViewModel = RefuelingViewModel(refuelingRepository);
      _lockViewModel = LockViewModel(
          applicationInfoRepository, secureRepository, restClient);
      _stationsViewModel = StationsViewModel(stationsRepository);
      _homeViewModel = HomeViewModel(vehicleRepository, refuelingRepository,
          notificationRepository, accountRepository);

      await checkAccountAndSetNavigation(accountRepository, restClient);

      final FirebaseMessaging messaging = FirebaseMessaging.instance;
      final NotificationSettings settings = await messaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );

      AppDebug.log('User granted permission: ${settings.authorizationStatus}');

      FirebaseMessaging.onMessage.listen((RemoteMessage event) {
        final String currentMessage = event.notification?.body ?? 'unknown';

        if (notificationSemaphore != 0) {
          return;
        }
        notificationSemaphore = 1;
        Future<void>.delayed(const Duration(seconds: 1))
            .then((_) => notificationSemaphore = 0);

        AppDebug.log('Notifiche rifornimenti add: $currentMessage');
        database.notificationDao
            .insert(app_notification.Notification(currentMessage))
            .then((int id) {
          AppDebug.log('Notifiche rifornimenti registrato con id ${id}');
        });
      });

      FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

      AppDebug.log('Setup completato con successo');
    } catch (error) {
      AppDebug.log('Setup completato con errori');
      AppDebug.log(error.toString());
    }

    return true;
  }

  Future<void> checkAccountAndSetNavigation(
      AccountRepositoryImpl accountRepository, ApiClient restClient) async {
    final AdminUserDTO? account = await accountRepository.getAccount();
    final String? jwtToken = await accountRepository.getJWTToken();
    if (account != null && jwtToken != null) {
      restClient.setJWTToken(jwtToken);
      _initialRouteName = LockScreen.routeName;
    } else {
      _initialRouteName = LoginScreen.routeName;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
        future: _applicationInit(),
        initialData: false,
        builder: (BuildContext context, AsyncSnapshot<Object?> snapshot) {
          if (snapshot.hasData && snapshot.data == true) {
            return _buildApp();
          } else {
            return _buildSplashScreen();
          }
        });
  }

  Widget _buildApp() {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LockViewModel>(
          create: (BuildContext context) => _lockViewModel,
        ),
        ChangeNotifierProvider<HomeViewModel>(
          create: (BuildContext context) => _homeViewModel,
        ),
        ChangeNotifierProvider<VehicleViewModel>(
          create: (BuildContext context) => _vehicleViewModel,
        ),
        ChangeNotifierProvider<RefuelingViewModel>(
          create: (BuildContext context) => _refuelingViewModel,
        ),
        ChangeNotifierProvider<StationsViewModel>(
          create: (BuildContext context) => _stationsViewModel,
        ),
      ],
      child: MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: const [Locale('it')],
        theme: _buildThemeData(),
        initialRoute: _initialRouteName,
        routes: {
          MainScreen.routeName: (BuildContext ctx) => const MainScreen(),
          LockScreen.routeName: (BuildContext ctx) => const LockScreen(),
          LoginScreen.routeName: (BuildContext ctx) => const LoginScreen(),
          RefuelingDetailScreen.routeName: (BuildContext ctx) =>
              const RefuelingDetailScreen(),
          RefuelingListScreen.routeName: (BuildContext ctx) =>
              const RefuelingListScreen(),
          VehicleListScreen.routeName: (BuildContext ctx) =>
              const VehicleListScreen(),
          VehicleDetailScreen.routeName: (BuildContext ctx) =>
              const VehicleDetailScreen(),
          QRCodeScreen.routeName: (BuildContext ctx) => const QRCodeScreen(),
        },
      ),
    );
  }

  ThemeData _buildThemeData() {
    return ThemeData(
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
          .copyWith(secondary: Colors.orange),
      fontFamily: 'tillitium_web',
    );
  }

  Widget _buildSplashScreen() {
    return MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: const [Locale('it')],
        theme: _buildThemeData(),
        home: PleaseWait());
  }
}

class ScreenArguments {
  late String? title;
  late int? id;

  ScreenArguments({this.title, this.id});
}
