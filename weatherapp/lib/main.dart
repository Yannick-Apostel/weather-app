import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/Theme.dart';
import 'package:weatherapp/application/bloc/weather_bloc.dart';
import 'package:weatherapp/application/theme_service.dart';
import 'package:weatherapp/presentation/home/homepage.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weatherapp/presentation/home/widget/errorContainer.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeService(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(builder: (context, themeService, child) {
      return MaterialApp(
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: themeService.isDarkModeOn? ThemeMode.dark: ThemeMode.light,
        home: FutureBuilder(
          future: _determinePosition(),
          builder: (context, snap) {
            if (snap.hasData) {
              return BlocProvider(
                create: (context) => WeatherBloc()..add(GetWeatherData()),
                child: const HomePage(),
              );
            } else {
              return Scaffold(
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Text('Loading'),
                      ),
                      Container(
                        child: CircularProgressIndicator(),
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        ),
      );
    });
  }
}

//! geolocator

Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  return await Geolocator.getCurrentPosition();
}
