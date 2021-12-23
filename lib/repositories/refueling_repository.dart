import 'model/refueling.dart';

abstract class RefuelingRepository {
  Future<List<Refueling>> getDataByTarga(String targa);

  Future<Refueling> getDataById(int id);
}
