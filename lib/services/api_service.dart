import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../constants/apis.dart';

class APIService{
  final Dio _dio = Dio();

  APIService(){
    _dio.options.baseUrl = APIS.baseURL;
    _dio.interceptors.add(PrettyDioLogger(
      responseBody: false,
      requestHeader : false,
      requestBody :false,
    ));
  }

  Dio get dio=>_dio;
}