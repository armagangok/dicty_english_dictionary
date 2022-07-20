import '../../network/IResponseModel.dart';

class BaseError extends ErrorModel {
  final String message;

  BaseError(this.message);
}
