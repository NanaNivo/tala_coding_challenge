import 'dart:io';


import 'package:dio/dio.dart';

import '../error/cancel_error.dart';
import '../error/connection/net_error.dart';
import '../error/connection/socket_error.dart';
import '../error/connection/timeout_error.dart';
import '../error/connection/unknown_error.dart';
import '../error/http/bad_request_error.dart';
import '../error/http/conflict_error.dart';
import '../error/http/forbidden_error.dart';
import '../error/http/internal_server_error.dart';
import '../error/http/not_found_error.dart';
import '../error/http/unauthorized_error.dart';
import '../error/http_error.dart';

mixin ErrorHandler on Object {

   handleError(DioException error) {

     if (error.type == DioExceptionType.unknown ||
        error.type == DioExceptionType.badResponse) {

      if(error is SocketException) return SocketError();

      if (error.type == DioExceptionType.badResponse) {
        switch (error.response!.statusCode) {
          case 400:
            return BadRequestError();
          case 401:
            return UnauthorizedError();
          case 403:
            return ForbiddenError();
          case 404:
            return NotFoundError();
          case 409:
            return ConflictError();
          case 500:
            return InternalServerError();
          default:
            return HttpError();
        }
      }
      return NetError();
    }else if (error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.sendTimeout ||
        error.type == DioExceptionType.receiveTimeout) {
      return TimeoutError();
    } else if (error.type == DioExceptionType.cancel) {
      return CancelError();
    } else {
      return UnknownError();
    }
  }
}
