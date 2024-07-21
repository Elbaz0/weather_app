import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weather_cubit/get_weather_cubit.dart';

import 'package:weather_app/home_page.dart';
import 'package:weather_app/service/wither_service.dart';

void main() {
  runApp(BlocProvider(
    create: (context) {
      return getWeatherCubit(WitherService(Dio()));
    },
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
