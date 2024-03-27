abstract class DataState<T> {
  final T? data;
  final T? error;
  const DataState({this.data, this.error});
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data);
}

class DataFaild<T> extends DataState<T> {
  const DataFaild(T error) : super(error: error);
}
