abstract class UseCaseOne<T, P> {
  Future<T> call(P p);
}
abstract class UseCase<T> {
  Future<T> call();
}
