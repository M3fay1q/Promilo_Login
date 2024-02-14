class DioResult<T> {
  DioResult._();

  factory DioResult.loading(T msg) = LoadingState<T>;

  factory DioResult.success(T value) = SuccessState<T>;

  factory DioResult.error(T msg) = ErrorState<T>;

  factory DioResult.networkError(T msg) = NetworkErrorState<T>;
}

class LoadingState<T> extends DioResult<T> {
  LoadingState(this.message) : super._();
  final T message;
}

class ErrorState<T> extends DioResult<T> {
  ErrorState(this.message) : super._();
  final T message;
}

class NetworkErrorState<T> extends DioResult<T> {
  NetworkErrorState(this.message) : super._();
  final T message;
}

class SuccessState<T> extends DioResult<T> {
  SuccessState(this.value) : super._();
  final T value;
}
