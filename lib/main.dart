import 'package:benzapp_flutter/repositories/account_repository.dart';
import 'package:benzapp_flutter/repositories/persistence/account_repository_impl.dart';
import 'package:benzapp_flutter/ui/screens/lock_screen.dart';
import 'package:benzapp_flutter/ui/screens/login_screen.dart';
import 'package:benzapp_flutter/ui/screens/main_screen.dart';
import 'package:benzapp_flutter/viewmodels/account_view_model.dart';
import 'package:benzapp_flutter/viewmodels/vehicle_view_model.dart';
import 'package:firebase_core/firebase_core.dart';
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

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ApiClient restClient = ApiClient();
    AccountRepository accountRepository = AccountRepositoryImpl(restClient);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => VehicleViewModel(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => AccountViewModel(accountRepository),
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
          '/': (ctx) => const MainScreen(),
          LockScreen.routeName: (ctx) => const LockScreen(),
          LoginScreen.routeName: (ctx) => const LoginScreen(),
        },
      ),
    );
  }
}
