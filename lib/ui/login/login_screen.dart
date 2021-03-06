import 'package:benzapp_flutter/repositories/network/api_client.dart';
import 'package:benzapp_flutter/ui/home/home_view_model.dart';
import 'package:benzapp_flutter/ui/widgets/app_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg_provider;
import 'package:provider/provider.dart';

import '../lock/lock_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

/// AnimationControllers can be created with `vsync: this` because of TickerProviderStateMixin.
class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localization = AppLocalizations.of(context)!;
    final HomeViewModel homeViewModel = Provider.of<HomeViewModel>(context);

    return Scaffold(
        body: Container(
            decoration: _buildBoxDecoration(),
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
                            child: Icon(
                              Icons.lock_outline,
                              color: Colors.white,
                              size: 48,
                            )),
                        _buildText(localization.login, fontSize: 48),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildText(homeViewModel.backendBaseUrl),
                            Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: OutlinedButton.icon(
                                    onPressed: () {
                                      homeViewModel.refreshRemoteConfig(
                                          updateUI: true);
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
                        color: Colors.white,
                        constraints: const BoxConstraints.expand(),
                        child: Center(
                          child: Padding(
                              padding: const EdgeInsets.all(24.0),
                              child: Stack(children: [
                                (!homeViewModel.isLoading)
                                    ? Center(
                                        child: SizedBox(
                                            width: double.infinity,
                                            child: ElevatedButton(
                                                onPressed: () => {
                                                      _login(context,
                                                          homeViewModel)
                                                    },
                                                child:
                                                    Text(localization.accedi))))
                                    : const Center(
                                        child: AppCircularProgressIndicator()),
                              ])),
                        ))),
              ],
            )));
  }

  BoxDecoration _buildBoxDecoration() {
    return const BoxDecoration(
        image: DecorationImage(
      image: svg_provider.Svg('assets/svg/home_background.svg'),
      fit: BoxFit.fitHeight,
    ));
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

  Widget _buildText(String text, {double fontSize = 14}) {
    return Flexible(
        child: Text(text,
            style: TextStyle(fontSize: fontSize, color: Colors.white),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis));
  }

  Future<void> _login(BuildContext context, HomeViewModel viewModel) async {
    FocusScope.of(context).unfocus();
    final LoginStatus loginStatus = await viewModel.login(
        _userController.value.text, _passwordController.value.text);

    if (loginStatus == LoginStatus.success) {
      Navigator.of(context).pushReplacementNamed(LockScreen.routeName);
    } else {
      final AppLocalizations localization = AppLocalizations.of(context)!;
      final SnackBar snackBar = SnackBar(
        content: Text(localization.loginInvalidCredential),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
