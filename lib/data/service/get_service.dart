import 'package:dio/dio.dart';
// import 'package:newsapp/data/model/model.dart';

class MyService {
  Future<dynamic> getService() async {
    try {
      Response response =
          await Dio().get("https://nbu.uz/uz/exchange-rates/json/");
      if (response.statusCode == 200) {
        return response.data;
        // return (response.data as List).map((e) => Course.fromJson(e)).toList();
      } else {
        return response.statusMessage.toString();
      }
    } on DioError catch (e) {
      return e.error.toString();
    }
  }
}
