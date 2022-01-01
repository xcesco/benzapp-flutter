abstract class AbstractRepository<E> {
  Future<void> update() async {}

  Future<List<E>> getData() async {
    throw UnimplementedError();
  }
}
