import 'package:dio/dio.dart';

class DioHelper {
 static late Dio dio;

 static init()
 {
  dio = Dio(
   BaseOptions(
    //https://newsapi.org/
    // v2/everything?
    // q=tesla&from=2022-12-29&sortBy=publishedAt&apiKey=API_KEY
    baseUrl:'https://newsapi.org/' ,
    receiveDataWhenStatusError:true ,
   ),
  );
 }

static Future<Response> getData({
 required String url,
  required Map<String,dynamic> query,
})async
 {
  return await dio.get(url,queryParameters:query, );
 }
}