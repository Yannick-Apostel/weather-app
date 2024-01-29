import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/application/bloc/weather_bloc.dart';
import 'package:weatherapp/presentation/home/widget/actionButton.dart';
import 'package:weatherapp/presentation/home/widget/errorContainer.dart';

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
              decoration: const BoxDecoration(color: Colors.white),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Container(
                      width: double.infinity,
                      child: Row(
                        children: [
                          const Icon(Icons.location_on),
                          Text(
                            ' ${state.weather.areaName}',
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          gradient: const LinearGradient(
                              colors: [
                                Color(0xff20FACF),
                                Color(0xff144AFA),
                                Color(0xffB63CFA)
                              ],
                              begin: Alignment.bottomRight,
                              end: Alignment.centerLeft),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 2,
                                color: Colors.grey.shade400,
                                offset: Offset(5, 5))
                          ]),
                      width: 350,
                      height: 250,
                      child: Column(
                        children: [
                          getWeatherIcon(state.weather.weatherConditionCode),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                    "${state.weather.weatherMain} • ${state.weather.temperature!.celsius!.round()}°C",
                                    style: const TextStyle(
                                        fontSize: 36,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                              ])
                        ],
                      )),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    width: 350,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 25,
                              width: 25,
                              color: Colors.blue,
                            ),
                            const SizedBox(
                              height: 5,
                              width: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Sunrise',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300),
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  DateFormat('')
                                      .add_jm()
                                      .format(state.weather.sunrise!),
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              height: 25,
                              width: 25,
                              color: Colors.blue,
                            ),
                            const SizedBox(
                              height: 5,
                              width: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Sunset',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300),
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  DateFormat('')
                                      .add_jm()
                                      .format(state.weather.sunset!),
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 5.0, horizontal: 30),
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                  Container(
                    width: 350,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 25,
                              width: 25,
                              color: Colors.blue,
                            ),
                            const SizedBox(
                              height: 5,
                              width: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Temp Max',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300),
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  '${state.weather.tempMax!.celsius!.round()}°C',
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              height: 25,
                              width: 25,
                              color: Colors.blue,
                            ),
                            const SizedBox(
                              height: 5,
                              width: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Temp Min',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300),
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  '${state.weather.tempMin!.celsius!.round()}°C',
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(
                    'Next days',
                    style: TextStyle(fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 150,
                    child: Expanded(
                      child: Center(
                        child: Container(
                          height: 150,
                          child: ListView.separated(
                            scrollDirection:
                                axisDirectionToAxis(AxisDirection.right),
                            itemCount: state.weatherList.length,
                            padding: const EdgeInsets.all(6),
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.all(6),
                                child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                              blurRadius: 2,
                                              color: Colors.grey.shade400,
                                              offset: Offset(5, 5))
                                        ]),
                                    width: 100,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          child: Text(
                                            DateFormat('EEEE').add_jm().format(
                                                state.weatherList[index].date!),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                          width: 40,
                                          height: 40,
                                          child: getWeatherIcon(state
                                              .weatherList[index]
                                              .weatherConditionCode),
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
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const Divider();
                            },
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          } else {
            return Container(
              child: const ErrorContainer(),
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
        return Image.asset('assets/images/thunderstorm.png');
      case (>= 300 && <= 321):
        //Nieselregen
        debugPrint('Nieselregen');
        return Image.asset('assets/images/rain.png');
      case (>= 500 && <= 531):
        //Regen
        debugPrint('Regen');
        return Image.asset('assets/images/rain.png');

      case (>= 600 && <= 622):
        //Schnee
        debugPrint('Schnee');
        return Image.asset('assets/images/snow.png');
      case (800):
        //klar
        debugPrint('klar');
        return Image.asset('assets/images/sun.png');
      case (>= 801 && <= 804):
        //bewölkt
        debugPrint('bewölkt');
        return Image.asset('assets/images/clouds.png');
      default:
        debugPrint('error');
        return Image.asset('');
    }
  }
}
