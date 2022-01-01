import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:benzapp_flutter/repositories/model/vehicle.dart';
import 'package:benzapp_flutter/repositories/vehicle_repository.dart';
import 'package:benzapp_flutter/ui/qrcode/qrcode_data.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';

import '../../viewmodels/base_view_model.dart';

class VehicleViewModel extends BaseViewModel {
  final VehicleRepository _vehicleRepository;

  VehicleViewModel(this._vehicleRepository);

  Future<List<Vehicle>> loadData() async => await _vehicleRepository.getData();

  Future<Vehicle?> loadDataByTarga(String targa) async =>
      await _vehicleRepository.findByTarga(targa);

  Future<QRCodeData?> loadQRCode(String targa) async {
    final Vehicle? vehicle = await loadDataByTarga(targa);

    if (vehicle != null) {
      final codiceFiscale = vehicle.cittadino.codiceFiscale;
      final TipoVeicolo tipoVeicolo = TipoVeicolo.values
          .firstWhere((TipoVeicolo item) => item.name == vehicle.veicolo.name);
      final TipoCarburante tipoCarburante = TipoCarburante.values
          .firstWhere((item) => item.name == vehicle.carburante.name);
      final QRCodeData qrCode = QRCodeData(codiceFiscale!, vehicle.codice,
          vehicle.targa, tipoVeicolo, tipoCarburante);

      return qrCode;
    }

    return null;
  }

  Future<void> shareQRCode(QRCodeData qrcodeData) async {
    final QrValidationResult qrValidationResult = QrValidator.validate(
      data: jsonEncode(qrcodeData.toJson()),
      version: QrVersions.auto,
      errorCorrectionLevel: QrErrorCorrectLevel.L,
    );

    final QrPainter painter = QrPainter.withQr(
      qr: qrValidationResult.qrCode!,
      color: const Color(0xFF000000),
      gapless: true,
      embeddedImageStyle: null,
      embeddedImage: null,
    );

    final Directory tempDir = await getTemporaryDirectory();
    final String tempPath = tempDir.path;
    final String ts = DateTime.now().millisecondsSinceEpoch.toString();
    final String path = '$tempPath/$ts.png';

    final ByteData? picData =
        await painter.toImageData(1024, format: ImageByteFormat.png);
    await _writeToFile(picData!, path);

    Share.shareFiles(['$path'], text: 'Share QRCode');
  }

  Future<void> _writeToFile(ByteData data, String path) async {
    final ByteBuffer buffer = data.buffer;
    await File(path).writeAsBytes(
        buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
  }
}
