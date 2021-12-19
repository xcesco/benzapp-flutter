import 'dart:math';

import 'package:benzapp_flutter/widgets/number_pad.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LockScreen extends StatefulWidget {
  static const String routeName = '/lock';

  const LockScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return LockScreenState();
  }
}

class LockScreenState extends State<LockScreen> {
  @override
  void initState() {
    super.initState();
    displayCode = getNextCode();
  }

  late String displayCode;
  TextEditingController pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double dpiScale = MediaQuery.of(context).devicePixelRatio;

    return Scaffold(
        body: Row(children: [
      Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        buildDisplayPin(context),
        buildNumpad(),
        buildFooter(context)
      ])
    ]));
  }

  Expanded buildFooter(BuildContext context) {
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

  Expanded buildNumpad() {
    return Expanded(
        flex: 7,
        child: KeyPad(
          pinController: pinController,
          isPinLogin: false,
          onChange: (String pin) {
            pinController.text = pin;
            print('${pinController.text}');
            setState(() {});
          },
          onSubmit: (String pin) {
            if (pin.length != 6) {
              (pin.isEmpty)
                  ? showInSnackBar('Please Enter Pin')
                  : showInSnackBar('Wrong Pin');
              return;
            } else {
              pinController.text = pin;

              if (pinController.text == displayCode) {
                showInSnackBar('Pin Match');
                setState(() {
                  displayCode = getNextCode();
                });
              } else {
                showInSnackBar('Wrong pin');
              }
              if (kDebugMode) {
                print('Pin is ${pinController.text}');
              }
            }
          },
        ));
  }

  Expanded buildDisplayPin(BuildContext context) {
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
                    children: const [
                      Text(
                        'Benzapp Flutter',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      Spacer(), // I just added one line
                      Icon(
                        Icons.info,
                        color: Colors.white,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          'Ho perso il pin',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ],
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
                          child: const Text(
                            'Inserisci il PIN a 6 cifre',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 16),
                          child: Text(
                            pinController.text.characters
                                .map((e) => '\u2B24')
                                .join(),
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              letterSpacing: 6.0,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 16),
                          child: const Text(
                            'PIN Errato',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        )
                      ],
                    )),
              ],
            ),
          ),
        ));
  }

  void showInSnackBar(String value) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(value),
    ));
  }

  getNextCode() {
    pinController.text = '';
    var rng = Random();
    var code = (rng.nextInt(9000) + 1000).toString();
    print('Random No is : $code');
    return code;
  }
}
