import 'package:dio/dio.dart';

class Http {
  BaseOptions baseOptions = BaseOptions(
      baseUrl: "https://sandbox.api.lettutor.com/",
      responseType: ResponseType.json,
      receiveTimeout: 60000,
      contentType: Headers.formUrlEncodedContentType);
  Dio client = Dio();
  Http() {
    client = Dio(baseOptions);
  }
}
