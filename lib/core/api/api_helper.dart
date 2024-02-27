import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tala_coding_challenge/core/error/http/forbidden_error.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../app+injection/di.dart';
import '../enums/api/HttpMethod.dart';
import '../error/base_error.dart';
import '../error/connection/socket_error.dart';
import '../error/connection/unknown_error.dart';
import '../factories/ModelFactory.dart';
import '../resources/apis.dart';
import '../services/session_manager.dart';
import 'auth_interceptor.dart';
import 'handler.dart';


class ApiHelper with ErrorHandler, RefreshableRequest{
  Future<Either<BaseError, T>> sendRequest<T>(
      {required HttpMethod method,
      required String url,
      Map<String, dynamic> data = const {},
      Map<String, String> headers = const {},
      CancelToken? cancelToken,
      bool withRefreshToken = true}) async {
    assert(method != null);
    assert(url != null);

    Dio dio = withRefreshToken? getRefreshableDio() :  Dio();
    try {
     late Response response;

      switch (method) {
        case HttpMethod.GET:
          print('url: [$url] data: [$data] header:${headers}');

          response = await dio.get(
            url,
            queryParameters:  data,
            options: Options(
                headers: headers,
                followRedirects: false,
                validateStatus: (status) {
                  return true;// status! < 500 && status != 401 && status != 403;
                }),
            cancelToken: cancelToken,
          );
          break;

        case HttpMethod.POST:
          print('url: [$url] data: [$data] headers: [$headers]');

          response = await dio.post(
            url,
            data: FormData.fromMap(data),
            options: Options(
                headers: headers,
                followRedirects: false,
                validateStatus: (status) {
                  return status! <= 500 && status != 401 && status != 403;
                }),
            cancelToken: cancelToken,
          );

          break;
        case HttpMethod.PUT:
          response = await dio.put(
            url,
            data: data,
            queryParameters: data,
            options: Options(
                headers: headers,
                followRedirects: false,
                validateStatus: (status) {
                  return status! < 500 && status != 401 && status != 403;
                }),
            cancelToken: cancelToken,
          );
          break;
        case HttpMethod.DELETE:
          response = await dio.delete(
            url,
            data: data,
            queryParameters: data,
            options: Options(
                headers: headers,
                followRedirects: false,
                validateStatus: (status) {
                  return status! < 500 && status != 401 && status != 403;
                }),
            cancelToken: cancelToken,
          );
          break;
        default:
          break;
      }
      var decoded;
      print('response: $response');

      decoded =
          response.data is String ? json.decode(response.data) : response.data;
      print('response: $response');
      return Right(ModelFactory.getInstance().createModel<T>(decoded));
    } on DioException catch (e, stacktrace) {
      BaseError error = _handleError(e);
      print('rror is ForbiddenError: ${error is ForbiddenError}, $e stacktrace: ${stacktrace}');
      if (error is ForbiddenError) throw ForbiddenError();
      return Left(error);
    } on SocketException catch (e) {
      return Left(SocketError());
    } catch (e, stacktrace) {
      print('stacktrace ${e} $stacktrace');
      return Left(UnknownError());
    }
  }

  _handleError(error) => handleError(error);
}
