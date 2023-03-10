import 'package:dio/dio.dart';


import 'end_points.dart';

//Dio Helper That's Connect and Talk to API.
class DioHelper {
  static late Dio dio;

  //Here The Initialize of Dio and Start Connect to API Using baseUrl.
  static init() {

    dio = Dio(BaseOptions(
      baseUrl: baseUrlar,
      receiveDataWhenStatusError: true,
    ));

  }

  //This Function to call API and get Some Data based on url(End Points) and Headers needed in API to get the Specific Data.
  static Future<Response<dynamic>> getData(
      {required String url, Map<String, dynamic>? query, String? token}) async {
    dio.options.headers = {

      "content-type": "application/json",
      "Accept-Language":'en',

      'auth-token': 'Bearer ${token??''}'
    };
    return await dio.get(url, queryParameters: query);
  }

  //This Function that's Used To Post Data to API based on URL(End Points) and Headers.
  static Future<Response<dynamic>> postData({
    required String url,
    Map<String, dynamic>? query,
     dynamic data,
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      "Accept-Language":'en',
      'auth-token': 'Bearer ${token??''}'
    };
    return await dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }

  //This Function That's Used to Update Some Date based on URL(End Points) and Send what's you need to Update as Map.
  static Future<Response<dynamic>> putData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      "Accept-Language": 'en',
      'auth-token': 'Bearer ${token??''}'

    };
    return await dio.put(url, queryParameters: query, data: data);
  }

  //This Function That's Used to Update Some Date based on URL(End Points) and Send what's you need to Update as Map.
  static Future<Response> patchData({
    required String url,
    required Map<String, dynamic> data,
    required String token,
    bool files = false,
  }) async {
    dio.options.headers = {
      'auth-token': 'Bearer ${token??''}',

    // 'Authorization': token ,
      'Content-Type': 'application/json',
      "Accept-Language": 'en',
    };
    return await dio.patch(
      url,
      data: data,
    );
  }

  static Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? data,
    String? token,
    //String lang = 'en',
  }) async {
    try {
      dio.options.headers = {
        'auth-token': 'Bearer ${token??''}',

        // 'Authorization': token ,
        'Content-Type': 'application/json',
        "Accept-Language":'en',
      };
      final Response response = await dio.delete(
        url,
        data: data,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
