import 'package:dio/dio.dart';
import 'package:tala_coding_challenge/core/enums/api/HttpMethod.dart';
import 'package:flutter/foundation.dart';

class ApiCallParams<Response> {
  final String responseStr;
  final Response Function(dynamic) mapper;
  final HttpMethod method;
  final String url;
  final Map<String, String>? queryParameters;
  final Map<String, dynamic> data;
  String? token;
  final CancelToken? cancelToken;
  final String acceptLang;
  final String? refreshCaller;
  final String? refreshToken;

  ApiCallParams({
    required this.responseStr,
    required this.mapper,
    required this.method,
    required this.url,
    this.queryParameters,
    this.refreshToken,
    this.refreshCaller,
    this.data = const {},
    this.token,
    this.cancelToken,
    this.acceptLang = 'en',
  }){
    print('Categories Tracing ApiCallParams mapper${mapper}');
  }

  ApiCallParams changeToken(String token) {
    this.token = token;
    return this;
  }
}
