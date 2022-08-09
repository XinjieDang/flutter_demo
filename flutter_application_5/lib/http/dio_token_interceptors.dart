import 'package:dio/dio.dart';
import 'package:flutter_application_5/http/dio_util.dart';

class DioTokenInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (options.headers['token'] == null) {
      DioUtil.getInstance()?.dio.lock();
      Dio _tokenDio = Dio();
      _tokenDio
        ..get("http://10.0.2.2:8080/miniapp/login",
            queryParameters: {"loginCode": 111111}).then((d) {
          options.headers['token'] = d.data;
          handler.next(options);
        }).catchError((error, stackTrace) {
          handler.reject(error, true);
        }).whenComplete(() {
          DioUtil.getInstance()?.dio.unlock();
        }); // unlock the dio
    } else {
      options.headers['token'] = options.headers['token'];
      handler.next(options);
    }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    // 响应前需要做刷新token的操作

    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
  }
}
