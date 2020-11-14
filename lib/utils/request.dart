import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class Request {
  factory Request() => _resInstance();
  static Request _instance;
  Dio _dio;

  static Request _resInstance() {
    if (_instance == null) {
      _instance = Request._init();
    }

    return _instance;
  }

  Request._init() {
    _dio = Dio(BaseOptions(
      baseUrl: 'http://192.168.1.109:3000/',
      // baseUrl: 'http://192.168.1.8:3000/',
      connectTimeout: 5000,
      receiveTimeout: 5000,
    ));
    // 拦截器
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options) async {
          print(options);
          // 在请求被发送之前做一些事情
          return options; //continue
          // 如果你想完成请求并返回一些自定义数据，可以返回一个`Response`对象或返回`dio.resolve(data)`。
          // 这样请求将会被终止，上层then会被调用，then中返回的数据将是你的自定义数据data.
          //
          // 如果你想终止请求并触发一个错误,你可以返回一个`DioError`对象，或返回`dio.reject(errMsg)`，
          // 这样请求将被中止并触发异常，上层catchError会被调用。
        },
        onResponse: (Response response) async {
          // 在返回响应数据之前做一些预处理
          return response; // continue
        },
        onError: (DioError e) async {
          // 当请求失败时做一些预处理
          return e; //continue
        },
      ),
    );
  }

  Future<dynamic> get({@required String path, Map data}) {
    return _http(path, 'get', data);
  }

  Future<dynamic> post({@required String path, Map data}) {
    return _http(path, 'post', data);
  }

  Future<dynamic> _http(String path, String mode, Map data) async {
    try {
      switch (mode) {
        case 'get':
          var getResponse = await _dio.get(path, queryParameters: data);
          // print('getResponse $getResponse');
          return getResponse;
        case 'post':
          var postResponse = await _dio.post(path, data: data);
          return postResponse;
      }
    } catch (e) {
      print(e);
    }
  }
}