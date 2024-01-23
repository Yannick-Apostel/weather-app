import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/application/bloc/weather_bloc.dart';
import 'package:weatherapp/presentation/home/widget/actionButton.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Material(
      child: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is WeatherSuccess) {
            return Container(
              decoration: BoxDecoration(color: Color(0xfff2fa4d6)),
              child: Column(
                children: [
                  
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Container(
                      width: double.infinity,
                      child: Row(
                        children: [
                          Icon(Icons.location_on),
                          Text(
                            ' ${state.weather.areaName}',
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold), textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                      width: 250,
                      height: 250,
                      color: Colors.grey,
                      child:
                          getWeatherIcon(state.weather.weatherConditionCode)),
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
                    height: 25,
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
                          itemCount: state.weatherList.length,
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
                                        child: Text(
                                          DateFormat('EEEE').add_jm().format(
                                              state.weatherList[index].date!),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        color: Colors.grey,
                                        width: 40,
                                        height: 40,
                                        child: Text('ICON Placeholder'),
                                      ),
                                      Container(
                                        child: Text(
                                            '${state.weatherList[index].weatherMain}'),
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

  Image getWeatherIcon(code) {
    switch (code) {
      case (>= 200 && < 233):
        //Gewitter
        debugPrint('Gewitter');
        return Image.asset('');
      case (>= 300 && <= 321):
        //Nieselregen
        debugPrint('Nieselregen');
        return Image.asset('');
      case (>= 500 && <= 531):
        //Regen
        debugPrint('Regen');
        return Image.asset('');

      case (>= 600 && <= 622):
        //Schnee
        debugPrint('Schnee');
        return Image.asset('');
      case (800):
        //klar
        debugPrint('klar');
        return Image.asset('');
      case (>= 801 && <= 804):
        //bewölkt
        debugPrint('bewölkt');
        return Image.asset('');
      default:
        debugPrint('error');
        return Image.asset('');
    }
  }
}
