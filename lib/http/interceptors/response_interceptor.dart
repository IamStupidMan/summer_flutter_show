import 'package:dio/dio.dart';
import 'package:summerfluttershow/common/config/config.dart';
import 'package:summerfluttershow/common/local/local_storage.dart';
import 'package:summerfluttershow/http/result_data.dart';

import '../code.dart';

class ResponseInterceptor extends InterceptorsWrapper {
  @override
  onResponse(Response response) async {
   RequestOptions option = response.request;

   var value;
   try {
     var header = response.headers[Headers.contentTypeHeader];
     if(header != null && header.toString().contains("text")){
       value = new ResultData(response.data, true, Code.SUCCESS);
     }else{
       value = new ResultData(response.data, true, Code.SUCCESS,
           headers: response.headers);
     }
   }catch(e){
     print(e.toString() + option.path);
     value = new ResultData(response.data, false, response.statusCode,
         headers: response.headers);
   }

   return value;
  }
}
