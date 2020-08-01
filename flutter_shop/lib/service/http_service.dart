import 'package:dio/dio.dart';
import 'dart:async';
import '../config/http_conf.dart';
import 'dart:io';
import '../config/index.dart';

Future request(String url, {formdata})async {
  try {
    Response response;
    Dio dio = Dio();
    dio.options.contentType = Headers.formUrlEncodedContentType;
    if(formdata == null) {
      print(servicePath[url]);
      response = await dio.post(servicePath[url]);
    } else {
      
      response = await dio.post(servicePath[url], data: formdata);
    }
    if(response.statusCode == 200) {
      return response;
    }

    throw Exception('后端代码错误');


  } catch(e) {
    throw Exception('后端代码衣长');
  }
}