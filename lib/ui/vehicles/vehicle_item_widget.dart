import 'package:benzapp_flutter/app_debug.dart';
import 'package:benzapp_flutter/repositories/model/vehicle.dart';
import 'package:benzapp_flutter/ui/widgets/app_commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class VehicleItem extends StatelessWidget {
  final Vehicle _item;
  final void Function(Vehicle) _onItemSelected;
  final void Function(Vehicle) _onQRCodeSelected;

  const VehicleItem(this._item, this._onItemSelected, this._onQRCodeSelected);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localization = AppLocalizations.of(context)!;

    return ListTile(
      onTap: () => _onSelected(context, localization),
      contentPadding:
          const EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
      leading: createVehicleAvatar(_item),
      title: Text(
        _item.targa,
        style:
            const TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ..._buildDelega(context, _item),
          GestureDetector(
            child: const Padding(
                padding: EdgeInsets.only(right: 8),
                child: Icon(Icons.qr_code, color: Colors.indigoAccent)),
            onTap: () {
              _onQRCodeSelected(_item);
            },
          ),
          GestureDetector(
            child: const Icon(
              Icons.arrow_forward,
              color: Colors.indigoAccent,
            ),
            onTap: () => _onSelected(context, localization),
          ),
        ],
      ),
    );
  }

  void _onSelected(BuildContext context, AppLocalizations localization) {
    if (_item.delega) {
      showInformationDialog(
          context, localization.vehicleDelegaOperationNotAllowed);
    } else {
      _onItemSelected(_item);
    }
    AppDebug.log('DETAIL');
  }

  List<Widget> _buildDelega(BuildContext context, Vehicle item) {
    if (_item.delega) {
      final AppLocalizations localization = AppLocalizations.of(context)!;

      return <Widget>[
        Container(
          padding: const EdgeInsets.only(right: 14),
          child: Chip(
            label: Text(
              localization.vehicleDelega,
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.indigoAccent,
          ),
        )
      ];
    } else {
      return [];
    }
  }
}
