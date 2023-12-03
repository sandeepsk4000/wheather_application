import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';
import 'package:weather_application/core/api_key.dart';

part 'weather_bloc_event.dart';
part 'weather_bloc_state.dart';

class WeatherBlocBloc extends Bloc<WeatherBlocEvent, WeatherBlocState> {
  WeatherBlocBloc() : super(WeatherBlocInitial()) {
    on<FetchWeather>((event, emit) async {
      emit(WeatherBlocLoding());
      try {
        WeatherFactory wf=WeatherFactory(apiKey,language: Language.ENGLISH);
      //  Position position= await Geolocator.getCurrentPosition();
        Weather weather=await wf.currentWeatherByLocation(event.position.latitude, 
       event.position.longitude);
        print(weather);
        emit(WeatherBlocSuccess(weather));
         
      } catch (e) {
        emit(WeatherBlocFailure()) ;
      }
    });
  }
}