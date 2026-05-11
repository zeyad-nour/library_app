import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  Failure(this.errorMessage);
}

class ServerFailuer extends Failure {
  ServerFailuer(super.errorMessage);

  factory ServerFailuer.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailuer("connection Time out with APIServer");
      case DioExceptionType.sendTimeout:
        return ServerFailuer("Send Time out");
      case DioExceptionType.receiveTimeout:
        return ServerFailuer("Receive Time out with APIServer");
      case DioExceptionType.badCertificate:
        return ServerFailuer("bad Certificate with APIServer");
      case DioExceptionType.badResponse:
        return ServerFailuer.fromResponse(
          dioError.response!.statusCode!,
          dioError.response!.data,
        );
      case DioExceptionType.cancel:
        return ServerFailuer("You`r Requst was Cancel");
      case DioExceptionType.connectionError:
        return ServerFailuer("connection Error");
      case DioExceptionType.unknown:
        return ServerFailuer("Unknown Error");
    }
  }

  factory ServerFailuer.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailuer(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailuer("Your Request not Found, Please try later");
    } else if (statusCode == 500) {
      return ServerFailuer("Internal Server Error, Please try later");
    } else if (statusCode == 503) {
      return ServerFailuer("Service temporarily unavailable.");
    } else {
      return ServerFailuer("Opps there was an Error, Please try agin");
    }
  }
}
