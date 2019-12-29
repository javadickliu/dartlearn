import 'package:dio/dio.dart';

///Dio单例模式
class DioSingleClass {
  static DioSingleClass _dioSingleClass;

  static DioSingleClass getInstance() {
    if (_dioSingleClass == null) {
      _dioSingleClass = DioSingleClass();
    }
    return _dioSingleClass;
  }

  ///初始化Dio请求
  Dio initDio() {
    BaseOptions options = BaseOptions(
      baseUrl: "https://www.baidu.com",
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );
    Dio dio = new Dio(options);
    return dio;
  }
}
