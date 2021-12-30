import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureRepository {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<bool?> containsKey(final String key) async {
    await _storage.containsKey(key: key);
  }

  Future<void> write(final String key, final String value) async {
    await _storage.write(key: key, value: value);
  }

  Future<String?> read(final String key) async {
    await _storage.read(key: key);
  }

  Future<void> writePin(String value) {
    return _storage.write(key: 'pin', value: value);
  }

  Future<String?> readPin() {
    return _storage.read(key: 'pin');
  }
}
