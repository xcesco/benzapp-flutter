
import 'package:benzapp_flutter/providers/vehicle_provider.dart';
import 'package:benzapp_flutter/screens/lock_screen.dart';
import 'package:benzapp_flutter/screens/login_screen.dart';
import 'package:benzapp_flutter/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => VehicleProvider(),
      child: MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: const [Locale('it')],
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
              .copyWith(secondary: Colors.orange),
          fontFamily: 'tillitium_web',
        ),
        initialRoute: '/',
        routes: {
          '/': (ctx) => const MainScreen(),
          LockScreen.routeName: (ctx) => const LockScreen(),
          LoginScreen.routeName: (ctx) => const LoginScreen(),
        },
      ),
    );
  }
}
