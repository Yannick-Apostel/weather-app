import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/application/bloc/weather_bloc.dart';
import 'package:weatherapp/presentation/home/widget/actionButton.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if(state is WeatherSuccess){
            return Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    end: Alignment.bottomCenter,
                    begin: Alignment.topCenter,
                    colors: [
                  Colors.white,
                  Colors.lightBlue[50]!,
                  Colors.lightBlue[100]!,
                  const Color.fromARGB(255, 81, 176, 253)
                ])),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  child:  Center(
                    child: Text(
                     ' ${state.weather.areaName}',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 350,
                  height: 350,
                  color: Colors.grey,
                  child: const Center(child: Text('PLaceholder')),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  child:  Text("${state.weather.temperature!.celsius!.round()}°C",
                      style:
                          TextStyle(fontSize: 48, fontWeight: FontWeight.bold)),
                ),
                Container(
                  child:  Text("${state.weather.weatherMain}",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(
                  height: 40,
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                    child: ActionButton(
                  text: 'more information',
                  callback: () {},
                ))
              ],
            ),
          );
          }else{
            return Container(
              child: Text('Error'),
            );
          }
          
        },
      ),
    );
  }

}
