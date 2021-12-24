import 'dart:convert';

import 'package:benzapp_flutter/repositories/model/station.dart';
import 'package:benzapp_flutter/repositories/persistence/account_repository_impl.dart';
import 'package:benzapp_flutter/repositories/persistence/app_database.dart';
import 'package:benzapp_flutter/repositories/persistence/vehicle_repository_impl.dart';
import 'package:benzapp_flutter/ui/screens/lock_screen.dart';
import 'package:benzapp_flutter/ui/screens/login_screen.dart';
import 'package:benzapp_flutter/ui/screens/main_screen.dart';
import 'package:benzapp_flutter/ui/widgets/app_progress_indicator.dart';
import 'package:benzapp_flutter/viewmodels/login_view_model.dart';
import 'package:benzapp_flutter/viewmodels/vehicle_view_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:floor/floor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'network/api_client.dart';

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
  late VehicleViewModel _vehicleViewModel;

  late LoginViewModel _loginViewModel;

  Future<bool> _init() async {
    final Callback callback = Callback(onCreate: (database, int version) async {
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

    _vehicleViewModel = VehicleViewModel();
    _loginViewModel = LoginViewModel(accountRepository, vehicleRepository);

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _init(),
        builder: (BuildContext context, AsyncSnapshot<Object?> snapshot) {
          if (snapshot.hasData) {
            return _buildApp();
          } else {
            return _buildSplashScreen();
          }
        });
  }

  Widget _buildApp() {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => _vehicleViewModel,
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => _loginViewModel,
        )
      ],
      child: MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: const [Locale('it')],
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
              .copyWith(secondary: Colors.orange),
          fontFamily: 'tillitium_web',
        ),
        initialRoute: LoginScreen.routeName,
        routes: {
          '/': (BuildContext ctx) => const MainScreen(),
          LockScreen.routeName: (BuildContext ctx) => const LockScreen(),
          LoginScreen.routeName: (BuildContext ctx) => const LoginScreen(),
        },
      ),
    );
  }

  Widget _buildSplashScreen() {
    return MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: const [Locale('it')],
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
              .copyWith(secondary: Colors.orange),
          fontFamily: 'tillitium_web',
        ),
        home: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const <Widget>[
              Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Initialization",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              SizedBox(height: 20),
              AppCircularProgressIndicator()
            ],
          ),
        ));
  }
}
