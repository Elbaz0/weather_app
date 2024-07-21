import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubit/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/screen/noweatherbody.dart';
import 'package:weather_app/screen/info.dart';
import 'package:weather_app/screen/search.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 255, 252, 252),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return search_view();
                      },
                    ),
                  );
                },
                icon: Icon(Icons.search))
          ],
          title: Text('Weather App'),
        ),
        body: BlocBuilder<getWeatherCubit, weather_state>(
          builder: (context, state) {
            if (state is WeathersccessState) {
              return info();
            } else if (state is initialStateweather) {
              return const Start_wither();
            } else if (state is WeatherLoadedState) {
              return Center(child: const CircularProgressIndicator());
            } else {
              return Center(
                  child: const Text(
                'opps , there was an error',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
              ));
            }
          },
        ));
  }
}
