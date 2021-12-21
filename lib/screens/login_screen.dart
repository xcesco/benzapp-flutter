import 'package:benzapp_flutter/providers/account_model.dart';
import 'package:drawable/drawable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

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

  TextEditingController _userController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: true);
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
    var accountProvider = Provider.of<AccountModel>(context);

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
                        Text(
                          localization.login,
                          style: const TextStyle(
                              fontSize: 48, color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              accountProvider.backendBaseUrl,
                              style: const TextStyle(color: Colors.white),
                            ),
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
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 24, right: 24, top: 8),
                          child: TextFormField(
                            controller: _userController,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              hintStyle: const TextStyle(color: Colors.black26),
                              hintText: localization.username,
                            ),
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return localization.username_required;
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 24, right: 24, top: 8),
                          child: TextFormField(
                            controller: _passwordController,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true, // dont forget this line
                              hintStyle: const TextStyle(color: Colors.black26),
                              hintText: localization.password,
                            ),
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return localization.password_required;
                              }
                              return null;
                            },
                          ),
                        ),
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

  login(BuildContext context, AccountModel accountProvider) {
    accountProvider.login(_userController.value.text, _passwordController.value.text).then((value) => {
          //Navigator.of(context).pushNamed(LockScreen.routeName)
        });
  }
}
