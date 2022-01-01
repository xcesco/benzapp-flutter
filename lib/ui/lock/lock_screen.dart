import 'package:benzapp_flutter/app_debug.dart';
import 'package:benzapp_flutter/ui/lock/lock_view_model.dart';
import 'package:benzapp_flutter/ui/lock/passcode_widget.dart';
import 'package:benzapp_flutter/ui/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class LockScreen extends StatefulWidget {
  static const String routeName = '/lock';

  const LockScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return LockScreenState();
  }
}

class LockScreenState extends State<LockScreen> {
  late String displayCode;
  late LockViewModel lockViewModel;

  @override
  Widget build(BuildContext context) {
    lockViewModel = Provider.of<LockViewModel>(context);
    String label = '${lockViewModel.appName} v.${lockViewModel.version}';

    return Scaffold(
      body: Row(children: [
        PasscodeWidget(
          lockViewModel.isPrimoAccesso(),
          lockViewModel.getCurrentPIN(),
          (String value) {
            AppDebug.log('PIN UNLOCK $value');
            lockViewModel.unlock(value).then((_) => Navigator.of(context).pushReplacementNamed(MainScreen.routeName));
          },
          (String value) {
            AppDebug.log('PIN GENERATED $value');
            lockViewModel.savePIN(value);
          },
          () {
            AppDebug.log('PIN WRONG');
          },
          headerTextLeft: label,
        )
      ]),
    );
  }
}
