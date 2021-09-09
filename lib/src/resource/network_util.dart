import 'dart:async';

import 'package:dio/dio.dart';
import 'package:phabis_flutter/src/resource/invoice_api_proivder.dart';

InvoiceApiProvider apiProvider = InvoiceApiProvider();

class NetworkUtil {
  static Dio _dio = new Dio();
  static NetworkUtil _instance = NetworkUtil.internal();

  static String newToken='';
  factory NetworkUtil() => _instance;
  static final String baseUrl = 'https://artemisoft.dyndns-work.com:8443';
  static final String allInvoicesUrl= baseUrl + '/phabis2-turnover/api/turnoverInvoice/page';

  NetworkUtil.internal() {
    _dio.interceptors.clear();
    _dio.options.baseUrl = allInvoicesUrl;
    _dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) {
      options.headers["Authorization"] = "Bearer " + newToken;
      return options;
    }, onResponse: (Response response) {
          print(response);
      // Do something with response data
      return response; // continue
    }, onError: (DioError e) {
      print('error interceptor');
      if (e.response != null) {
        print(e.response);
        print("Грешка: ${e.response.data['status']}, "
            "${e.response.data['message']}, ${e.response.data['error']}");
      } else {
        print(e.message);
      }
      return e; //continue
    }));
  }

  Future<Response> get(String url) async {
    return await _dio.get(url);
  }

  Future<Response> post(String url, {required Options options, data}) async {
    return await _dio.post(url, data: data, options: options);
  }

  Future<Response> put(String url, {required Options options, data}) async {
    return await _dio.put(url, data: data, options: options);
  }

  Future<Response> delete(String url, {data}) async {
    return await _dio.delete("$url$data");
  }
}
