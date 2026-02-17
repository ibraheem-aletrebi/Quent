import 'package:quent/core/services/network/api_error_handler.dart';
import 'package:quent/core/services/network/api_error_model.dart';

abstract class ApiResult<T> {
  const ApiResult();

  R when<R>({
    required R Function(T data) onSuccess,
    required R Function(ApiErrorModel error) onError,
  });

  factory ApiResult.success(T data) = ApiSuccess<T>;
  factory ApiResult.error(Object error) = ApiError<T>;
}

class ApiSuccess<T> extends ApiResult<T> {
  final T data;

  const ApiSuccess(this.data);

  @override
  R when<R>({
    required R Function(T data) onSuccess,
    required R Function(ApiErrorModel error) onError,
  }) {
    return onSuccess(data);
  }
}

class ApiError<T> extends ApiResult<T> {
  final Object error;

  const ApiError(this.error);

  @override
  R when<R>({
    required R Function(T data) onSuccess,
    required R Function(ApiErrorModel error) onError,
  }) {
    final handledError = ApiErrorHandler().handle(error);
    return onError(handledError);
  }
}
