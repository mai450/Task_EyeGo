import 'package:dio/dio.dart';

import 'failures.dart';

class ServerError extends Failure {
  ServerError(
    super.message,
  );

  factory ServerError.fromDioException(DioException dioExpection) {
    switch (dioExpection.type) {
      case DioExceptionType.connectionTimeout:
        return ServerError('Connection timeout with ApiServer');
      case DioExceptionType.sendTimeout:
        return ServerError('Send timeout with ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerError('Recive timeout with ApiServer');
      case DioExceptionType.badCertificate:
        return ServerError('Bad certificate with ApiServer');
      case DioExceptionType.badResponse:
        return ServerError.fromResponse(
            dioExpection.response!.statusCode!, dioExpection.response!.data);
      case DioExceptionType.cancel:
        return ServerError('Request to ApiServer was canceld');
      case DioExceptionType.connectionError:
        return ServerError('No Internet Connection');
      case DioExceptionType.unknown:
        return ServerError('Unexpected Error, Please try again!');
    }
  }
  factory ServerError.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerError(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerError('Your request not found, Please try later!');
    } else if (statusCode == 500) {
      return ServerError('Internal Server error, Please try later');
    } else {
      return ServerError('Opps There was an Error, Please try again');
    }
  }
}
