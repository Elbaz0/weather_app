import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/model/wither_model.dart';
import 'package:weather_app/service/wither_service.dart';

class getWeatherCubit extends Cubit<weather_state> {
  getWeatherCubit(super.initialStateweather);

  late witherModel weathermodel;

  getweather({required String cityname}) async {
    emit(WeatherLoadedState());
    try {
      weathermodel = await service(Dio()).getservice(cityname: cityname);
      emit(WeathersccessState());
      // emit(WeatherLoadedState(weathermodel: weathermodel));
    } catch (e) {
      emit(WeatherFaliurState());
    }
  }
}
