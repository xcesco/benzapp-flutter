import 'package:flutter/material.dart';

import 'app_progress_indicator.dart';

class PleaseWait extends StatelessWidget {
  const PleaseWait({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const <Widget>[
          Align(
              alignment: Alignment.center,
              child: Text(
                "Please wait",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              )),
          SizedBox(height: 20),
          AppCircularProgressIndicator()
        ],
      ),
    );
  }
}
