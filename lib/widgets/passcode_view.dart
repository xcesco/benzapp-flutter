import 'package:flutter/material.dart';

class PasscodeView extends StatelessWidget {
  const PasscodeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
          minWidth: double.infinity, maxHeight: double.infinity),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(child: Text("Babe")),
          Text("I miss you"),
        ],
      ),
    );
  }
}
