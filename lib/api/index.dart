import 'dart:convert';
import 'package:dio/dio.dart';

Future<Dio> getDio(context) async {
  Dio dio = Dio();

  BaseOptions options = new BaseOptions(responseType: ResponseType.json);

  dio.options = options;

  dio.interceptors.add(InterceptorsWrapper(onResponse: ((Response response,
      ResponseInterceptorHandler responseInterceptorHandler) {
    return responseInterceptorHandler.next(response);
  }), onError:
      ((DioError error, ErrorInterceptorHandler errorInterceptorHandler) {
/*     Map dataError = jsonDecode(error.response.toString());
    print('========ERROR==========');
    print(dataError);

    switch (dataError['statusCode']) {
      case 406:
        Navigator.pushNamed(context, '/LogIn');
        break;
      case 401:
        refreshTokenFunc(context);
        break;
      default:
    }
 */
    return errorInterceptorHandler.next(error);
  }), onRequest: (RequestOptions request, requestInterceptorHandler) async {
    return requestInterceptorHandler.next(request);
  }));
  return dio;
}