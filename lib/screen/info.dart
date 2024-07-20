import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/model/wither_model.dart';

class info extends StatelessWidget {
  info({super.key});

  @override
  Widget build(BuildContext context) {
    witherModel weathermodel =
        BlocProvider.of<getWeatherCubit>(context).weathermodel;

    return Scaffold(
      // appBar: AppBar(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: themeMode(weathermodel.temp!)),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 225),
            child: Column(
              children: [
                Text(
                  weathermodel.cityname,
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Updated at : ',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400)),
                    Text(weathermodel.date.substring(10, 16),
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.network("https:${weathermodel.image}"),
                    Text(
                      weathermodel.temp.toString(),
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                    ),
                    Column(
                      children: [
                        Text(
                          'Maxtemp : ${weathermodel.maxtemp.ceil()}',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w400),
                        ),
                        Text(
                          'Mintemp : ${weathermodel.mintemp.ceil()}',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w400),
                        ),
                      ],
                    )
                  ],
                ),
                Text(
                  weathermodel.weathercondition,
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

themeMode(condition) {
  if (condition > 20) {
    return [
      Color.fromARGB(143, 255, 179, 2),
      Color.fromARGB(44, 236, 236, 236)
    ];
  } else if (condition < 20 && condition > 10) {
    return [
      Color.fromARGB(255, 2, 137, 255),
      Color.fromARGB(105, 57, 140, 241)
    ];
  } else if (condition < 10) {
    return [
      Color.fromARGB(241, 0, 12, 105),
      Color.fromARGB(105, 13, 94, 142),
    ];
  }
}
