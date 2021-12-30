abstract class BaseRepository<E> {
  Future<void> update();

  Future<List<E>> getData();
}
