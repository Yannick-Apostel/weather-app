import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';
import 'package:weatherapp/keys/apiKey.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial())  {
    on<GetWeatherData>((event, emit) async {
      emit(WeatherLoading());
      try {
        Position currentPosition =  await Geolocator.getCurrentPosition();
          WeatherFactory wf =  WeatherFactory(API_KEY, language: Language.ENGLISH);
        Weather w = await wf.currentWeatherByLocation(currentPosition.latitude, currentPosition.longitude);
        emit(WeatherSuccess(w));
      } catch (e) {
        emit(WeatherFailure());
      }
    });
  }
}
