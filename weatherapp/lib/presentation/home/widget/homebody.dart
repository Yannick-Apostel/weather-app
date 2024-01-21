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
          if (state is WeatherSuccess) {
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
                    child: Center(
                      child: Text(
                        ' ${state.weather.areaName}',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
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
                    child: Text(
                        "${state.weather.temperature!.celsius!.round()}°C",
                        style: TextStyle(
                            fontSize: 48, fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    child: Text("${state.weather.weatherMain}",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Container(
                        width: double.infinity,
                        color: Colors.transparent,
                        child: Text(
                          'Next days',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.start,
                        )),
                  ),
                  Expanded(
                    child: Center(
                      child: SizedBox(
                        height: 150,
                        child: ListView.separated(
                          scrollDirection:
                              axisDirectionToAxis(AxisDirection.right),
                          itemCount: 9,
                          padding: const EdgeInsets.all(8),
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.white),
                                  width: 100,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        color: Colors.blue,
                                        child: Text(
                                          DateFormat('EEEE').add_jm().format(
                                              state.weatherList[index].date!),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        color: Colors.grey,
                                        width: 40,
                                        height: 40,
                                        child: Text('ICON Placeholder'),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        color: Colors.green,
                                        child: Text('29'),
                                      ),
                                    ],
                                  )
                                  //child: Text('${state.weatherList[index].weatherMain}'),

                                  ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const Divider();
                          },
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          } else {
            return Container(
              child: Text('Error'),
            );
          }
        },
      ),
    );
  }
}
