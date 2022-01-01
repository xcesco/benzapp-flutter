import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'app_progress_indicator.dart';

class PleaseWait extends StatelessWidget {
  const PleaseWait({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localization = AppLocalizations.of(context)!;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Align(
              alignment: Alignment.center,
              child: Text(
                localization.pleaseWait,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              )),
          const SizedBox(height: 20),
          const AppCircularProgressIndicator()
        ],
      ),
    );
  }
}
