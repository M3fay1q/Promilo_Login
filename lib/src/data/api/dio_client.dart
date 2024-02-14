import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart' as getx;

import 'custom_interceptors.dart';
import 'dio_constants.dart';
import 'dio_exceptions.dart';
import 'dio_result.dart';

class DioClient {
  static const int timeOutInSeconds = 50;

  BaseOptions options = BaseOptions(
    connectTimeout: 10000.milliseconds,
    receiveTimeout: 10000.milliseconds,
  );
  late final Dio dio = Dio(options)
    ..interceptors.add(
      CustomInterceptors(),
    );

  //GET
  Future<DioResult> get(String? api) async {
    var url = DioConstants.baseURL + api!;
    dio.options.headers['Content-Type'] = Headers.jsonContentType;
    try {
      Response response = await dio.get(
        url,
        options: Options(contentType: Headers.jsonContentType),
      );
      return DioResult.success(response.data);
    } on DioException catch (error) {
      if (error.error != null && error.error is SocketException) {
        log(error.message!);
        log("==>error.error.message");
        return DioResult.networkError('Please verify your internet connection');
      }
      var errorMessage = DioExceptions.fromDioError(error).toString();
      log(error.response?.data ?? error.message);
      return DioResult.error(errorMessage);
    } catch (err) {
      log(err.toString());
      return DioResult.error(err.toString());
    }
  }

  //POST
  Future<DioResult> post(
    String? api,
    postMap, {
    String? token,
  }) async {
    var url = DioConstants.baseURL + api!;

    try {
      Response response = await dio.post(url,
          data: postMap,
          options: Options(
            contentType: Headers.formUrlEncodedContentType,
            headers: {
              "authorization": "Basic UHJvbWlsbzpxNCE1NkBaeSN4MiRHQg==",
            },
          ), onReceiveProgress: (
        int receive,
        int total,
      ) {
        if (kDebugMode) {
          print(
              'progress: ${(receive / total * 100).toStringAsFixed(0)}% ($receive/$total)');
        }
      });

      debugPrint(response.data.toString());
      return DioResult.success(response.data);
    } on DioException catch (error) {
      debugPrint(error.response?.data.toString());
      debugPrint(error.toString());
      if (error.error != null && error.error is SocketException) {
        return DioResult.networkError(error.message.toString());
      }

      var errorMessage = DioExceptions.fromDioError(error).toString();

      return DioResult.error(errorMessage);
    } catch (err) {
      debugPrint(err.toString());
      return DioResult.error(err.toString());
    }
  }
}
