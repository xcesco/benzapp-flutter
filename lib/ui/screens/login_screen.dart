import 'package:benzapp_flutter/network/api_client.dart';
import 'package:benzapp_flutter/viewmodels/account_view_model.dart';
import 'package:drawable/drawable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'lock_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

/// AnimationControllers can be created with `vsync: this` because of TickerProviderStateMixin.
class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  late AnimationController controller;

  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context)!;
    var accountProvider = Provider.of<AccountViewModel>(context);

    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: DrawableImage("ic_home_background"),
              fit: BoxFit.cover,
            )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 5,
                  child: Container(
                      constraints: const BoxConstraints.expand(),
                      child: Column(children: [
                        const Padding(
                            padding: EdgeInsets.only(top: 82),
                            child: Image(
                              image: DrawableImage(
                                  'ic_lock_outline_primary_24dp',
                                  scale: .8),
                            )),
                        _buildText(localization.login, fontSize: 48),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildText(accountProvider.backendBaseUrl),
                            Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: OutlinedButton.icon(
                                    onPressed: () {
                                      accountProvider.initRemoteConfig();
                                    },
                                    icon: const Icon(Icons.sync,
                                        color: Colors.white),
                                    label: const Text(''))),
                          ],
                        ),
                        _buildInputText(_userController, localization.username,
                            localization.username_required),
                        _buildInputText(
                            _passwordController,
                            localization.password,
                            localization.password_required,
                            obscureText: true),
                      ])),
                ),
                Expanded(
                    flex: 1,
                    child: Container(
                        constraints: const BoxConstraints.expand(),
                        child: Center(
                          child: Padding(
                              padding: const EdgeInsets.all(24.0),
                              child: Stack(children: [
                                (!accountProvider.isLoading)
                                    ? Center(
                                        child: SizedBox(
                                            width: double.infinity,
                                            child: ElevatedButton(
                                                onPressed: () => {
                                                      login(context,
                                                          accountProvider)
                                                    },
                                                child:
                                                    Text(localization.accedi))))
                                    : Center(
                                        child: CircularProgressIndicator(
                                        color: Colors.orange,
                                        value: controller.value,
                                        semanticsLabel:
                                            'Linear progress indicator',
                                      )),
                              ])),
                        ))),
              ],
            )));
  }

  Padding _buildInputText(
      TextEditingController controller, String hintText, String errorMessage,
      {bool obscureText = false}) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 8),
      child: TextFormField(
        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintStyle: const TextStyle(color: Colors.black26),
          hintText: hintText,
        ),
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return errorMessage;
          }
          return null;
        },
      ),
    );
  }

  Text _buildText(String text, {double fontSize = 14}) {
    return Text(
      text,
      style: TextStyle(fontSize: fontSize, color: Colors.white),
      textAlign: TextAlign.center,
    );
  }

  login(BuildContext context, AccountViewModel accountViewModel) async {
    LoginStatus loginStatus = await accountViewModel.login(
        _userController.value.text, _passwordController.value.text);

    if (loginStatus == LoginStatus.success) {
      Navigator.of(context).pushNamed(LockScreen.routeName);
    } else {
      var localization = AppLocalizations.of(context)!;
      var snackBar = SnackBar(
        content: Text(localization.loginInvalidCredential),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
