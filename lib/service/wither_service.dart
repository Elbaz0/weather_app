import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:weather_app/model/wither_model.dart';

class WitherService {
  final Dio dio;
  WitherService(this.dio);
  Future<witherModel> getservice({required String cityname}) async {
    try {
      Response response = await dio.get(
          'https://api.weatherapi.com/v1/forecast.json?key=3f47288caa474f67a52134059240704&q=$cityname&days=1');

      witherModel withermodel = witherModel.fromJson(response.data);
      return withermodel;
    } on DioException catch (e) {
      final String errMessage =
          e.response?.data['error']['message'] ?? 'opss error try later ';
      throw Exception(errMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('');
    }
  }
}
