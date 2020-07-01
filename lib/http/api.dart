import 'dart:collection';

import 'package:dio/dio.dart';
import 'package:summerfluttershow/http/result_data.dart';

import 'code.dart';
import 'interceptors/error_interceptor.dart';
import 'interceptors/header_interceptor.dart';
import 'interceptors/log_interceptor.dart';
import 'interceptors/response_interceptor.dart';
import 'interceptors/token_interceptor.dart';

class HttpManager {
  static const CONTENT_TYPE_JSON = "application/json";
  static const CONTENT_TYPE_FORM = "application/x-www-form-urlencoded";

  static Dio _dio = new Dio();

  final TokenInterceptor _tokenInterceptor = new TokenInterceptor();
  final HeaderInterceptors _headerInterceptor = new HeaderInterceptors();
  final LogsInterceptors _logInterceptor = new LogsInterceptors();
  final ErrorInterceptors _errorInterceptor = new ErrorInterceptors(_dio);
  final ResponseInterceptor _responseInterceptor = new ResponseInterceptor();

  HttpManager() {
    _dio.interceptors.add(_headerInterceptor);

    _dio.interceptors.add(_tokenInterceptor);

    _dio.interceptors.add(_logInterceptor);

    _dio.interceptors.add(_errorInterceptor);

    _dio.interceptors.add(_responseInterceptor);
  }

  Future<ResultData> netFetch(
      String url, Map<String, dynamic> params, Map<String, dynamic> header, Options option,
      {noTip = false}) async {
    Map<String, dynamic> headers = new HashMap();
    if (header != null) {
      headers.addAll(header);
    }

    if (option != null) {
      option.headers = headers;
    } else {
      option = new Options(method: "get");
      option.headers = headers;
    }

    Response response;
    try {
      response = await _dio.request(url, data: params, options: option);
    } on DioError catch (e) {
      return resultError(e, noTip);
    }
    if (response.data is DioError) {
      return resultError(response.data, noTip);
    }
    return response.data;
  }

  ///清除授权
  clearAuthorization() {
    _tokenInterceptor.clearAuthorization();
  }

  ///获取授权token
  getAuthorization() async {
    return _tokenInterceptor.getAuthorization();
  }
}

final HttpManager httpManager = new HttpManager();

ResultData resultError(DioError e, bool noTip) {
  Response errorResponse;
  if (e.response != null) {
    errorResponse = e.response;
  } else {
    errorResponse = new Response(statusCode: 666);
  }
  if (e.type == DioErrorType.CONNECT_TIMEOUT ||
      e.type == DioErrorType.RECEIVE_TIMEOUT) {
    errorResponse.statusCode = Code.NETWORK_TIMEOUT;
  }
  return new ResultData(
      Code.errorHandleFunction(errorResponse.statusCode, e.message, noTip),
      false,
      errorResponse.statusCode);
}
