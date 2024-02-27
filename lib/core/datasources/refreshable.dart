import 'package:dio/dio.dart';
import 'package:tala_coding_challenge/core/datasources/function_instance.dart';
import 'package:tala_coding_challenge/core/datasources/remote_data_source.dart';
import 'package:flutter/material.dart';

mixin RefreshableRemote {
  Map<String, FunctionInstance> redoInvoker = {};

  void addFunction(String name, FunctionInstance function) {
    redoInvoker[name] = function;
  }

  void invokeFunctionWithNewToken(String name, String token) {
    if (!redoInvoker.containsKey(name)) {
      throw Exception("this command '$name' not found");
    }

    FunctionInstance instance = redoInvoker[name]!;
    instance.invokeWithNewToken(token);
  }

}
