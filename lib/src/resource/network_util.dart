import 'dart:io';
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:cookie_jar/cookie_jar.dart';

class NetworkUtil {
  static Dio _dio = new Dio();
  /*
  static String cookie;
  static NetworkUtil _instance = NetworkUtil.internal();
  factory NetworkUtil() => _instance;

  static final String baseUrl = 'https://artemisoft.dyndns-work.com:8443';
//  static final String baseUrl = 'http://192.168.87.234:8080';

 NetworkUtil.internal() {
    _dio.options.baseUrl = baseUrl;
    _dio.interceptors.add(CookieManager(CookieJar()));
    _dio.interceptors.add(InterceptorsWrapper(
        onRequest:(RequestOptions options){
          options.headers['Cookie'] = cookie;
          options.headers['withCredentials'] = "true";
          return options;
        },
        onResponse:(Response response) {
          // Do something with response data
          return response; // continue
        },
        onError: (DioError e) {
          print('error interceptor');
          if (e.response != null) {
            print(e.response);
//        print("Грешка: ${e.response.data['status']}, "
//            "${e.response.data['message']}, ${e.response.data['error']}");
          } else {
            print(e.message);
          }
          return e; //continue
        }
    ));
  }

  Future<Response> get(String url) async {
    return await _dio.get(url);
  }

  Future<Response> post(String url, {Options options, data}) async {
    return await _dio.post(url, data: data, options: options);
  }

  Future<Response> put(String url, {Options options, data}) async {
    return await _dio.put(url, data: data, options: options);
  }

  Future<Response> delete(String url, {data}) async {
    return await _dio.delete("$url$data");
  }

 */
}

