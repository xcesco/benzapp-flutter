import 'dart:math';

import 'package:benzapp_flutter/ui/widgets/app_commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'key_pad.dart';

class PasscodeWidget extends StatefulWidget {
  final TextEditingController _pinController = TextEditingController();
  final Function(String) _onUnlock;
  final Function(String) _onPinIsGenerated;
  final Function() _onWrongPin;
  final ValueSetter<String>? pinIsDefined;

  final String? headerTextLeft;
  final Future<String?> _pin;
  final Future<bool?> _primoAccesso;

  PasscodeWidget(this._primoAccesso, this._pin, this._onUnlock,
      this._onPinIsGenerated, this._onWrongPin,
      {Key? key, this.headerTextLeft, this.pinIsDefined})
      : super(key: key) {}

  @override
  State<StatefulWidget> createState() {
    return _PasscodeState();
  }
}

class _PasscodeState extends State<PasscodeWidget> {
  late TextEditingController _pinController;
  late AppLocalizations _localization;
  late String? _currentPin;

  TypePasscodeStatus _typePasscodeStatus = TypePasscodeStatus.unknown;

  _PasscodeState();

  @override
  Widget build(BuildContext context) {
    _pinController = widget._pinController;
    _localization = AppLocalizations.of(context)!;

    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      _buildDisplayPin(context),
      _buildNumpad(),
      _buildFooter(context)
    ]);
  }

  @override
  void initState() {
    widget._primoAccesso.then((bool? primoAccesso) {
      widget._pin.then((String? pin) => {
            setState(() {
              if (primoAccesso == true) {
                _typePasscodeStatus = TypePasscodeStatus.typeSetPasscode;
              } else {
                _currentPin = pin;
                _typePasscodeStatus = TypePasscodeStatus.typeCheckPassword;
              }
            })
          });
    });
  }

  Expanded _buildDisplayPin(BuildContext context) {
    return Expanded(
        flex: 5,
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(color: Colors.blue),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: _buildHeader(),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 30),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        const CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 32,
                          child: Icon(
                            Icons.lock,
                            size: 32,
                            color: Colors.blueAccent,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 16),
                          child: Text(
                            _buildTextPIN(),
                            style: const TextStyle(
                                fontSize: 18, color: Colors.white),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 16),
                          child: Text(
                            _pinController.text.characters
                                .map((String e) => '\u2B24')
                                .join(),
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              letterSpacing: 6.0,
                            ),
                          ),
                        ),
                        if (false)
                          Container(
                            margin: const EdgeInsets.only(top: 16),
                            child: const Text(
                              'PIN Errato',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          )
                      ],
                    )),
              ],
            ),
          ),
        ));
  }

  Expanded _buildFooter(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(color: Colors.white),
          child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Row(children: [
                Expanded(
                  flex: 3,
                  child: Image.asset('assets/images/logo_fvg.jpg'),
                ),
                const Expanded(flex: 1, child: Text('')),
                Expanded(
                  flex: 3,
                  child: Image.asset('assets/images/logo_insiel.png'),
                ),
              ]))),
    );
  }

  List<Widget> _buildHeader() {
    return [
      Text(
        widget.headerTextLeft ?? '',
        style: const TextStyle(fontSize: 18, color: Colors.white),
      ),
      const Spacer(),
      const Icon(
        Icons.info,
        color: Colors.white,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Text(
          _localization.lock_screen_no_pin,
          style: const TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    ];
  }

  Expanded _buildNumpad() {
    return Expanded(
        flex: 7,
        child: KeyPad(
          pinController: _pinController,
          isPinLogin: false,
          onChange: _onChangePIN,
          onSubmit: _onSubmitPIN,
        ));
  }

  _onSubmitPIN(String pin) {
    if (pin.length != 6) {
      (pin.isEmpty)
          ? showInSnackBar(context, 'Please Enter Pin')
          : showInSnackBar(context, 'Wrong Pin');
      return;
    } else {
      _pinController.text = pin.substring(0, min(pin.length, 6));

      if (_typePasscodeStatus == TypePasscodeStatus.typeCheckPassword) {
        if (_pinController.text == _currentPin) {
          widget._onUnlock(_currentPin!);
        } else {
          showInSnackBar(context, 'Wrong pin');

          widget._onWrongPin();
        }
      } else if (_typePasscodeStatus == TypePasscodeStatus.typeSetPasscode) {
        _currentPin = _pinController.text;
        _pinController.text = '';
        _typePasscodeStatus = TypePasscodeStatus.typeSetSecondPasscode;
      } else if (_typePasscodeStatus ==
          TypePasscodeStatus.typeSetSecondPasscode) {
        if (_pinController.text == _currentPin) {
          widget._onPinIsGenerated(_currentPin!);
          widget._onUnlock(_currentPin!);
        } else {
          showInSnackBar(context, 'Wrong pin');

          widget._onWrongPin();
          _typePasscodeStatus = TypePasscodeStatus.typeSetPasscode;
        }
        _currentPin = _currentPin;
        _typePasscodeStatus = TypePasscodeStatus.typeSetSecondPasscode;
        _pinController.text = '';
      }

      setState(() {
        // displayCode = getNextCode();
      });
    }
  }

  void _onChangePIN(String pin) {
    setState(() {
      _pinController.text = pin;
    });
  }

  String _buildTextPIN() {
    if (_typePasscodeStatus == TypePasscodeStatus.typeSetPasscode) {
      return _localization.lock_screen_definisci_pin;
    } else if (_typePasscodeStatus == TypePasscodeStatus.typeCheckPassword) {
      return _localization.lock_screen_inserisci_pin;
    } else if (_typePasscodeStatus ==
        TypePasscodeStatus.typeSetSecondPasscode) {
      return _localization.lock_screen_inserisci_nuovamente_pin;
    } else {
      return 'UNKNOWN';
    }
  }
}

enum TypePasscodeStatus {
  typeSetPasscode,
  typeSetSecondPasscode,
  typeCheckPassword,
  unknown
}
