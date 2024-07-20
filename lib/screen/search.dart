import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weather_cubit/get_weather_cubit.dart';

class search_view extends StatelessWidget {
  const search_view({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search City'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(143, 255, 179, 2),
                Color.fromARGB(44, 236, 236, 236)
              ]),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 18, right: 18),
          child: Center(
            child: TextField(
              onSubmitted: (value) async {
                var getdatacubit = BlocProvider.of<getWeatherCubit>(context);
                getdatacubit.getweather(cityname: value);
                Navigator.pop(context);
              },
              decoration: InputDecoration(
                hintText: 'Enter city name ',
                suffixIcon: Icon(Icons.search),
                contentPadding: EdgeInsets.only(top: 25, bottom: 25, left: 20),
                labelText: 'search',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
