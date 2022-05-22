import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cubit_bloc_tutorial/cubit/weather_state.dart';
import 'package:flutter_cubit_bloc_tutorial/data/model/weather.dart';
import 'package:flutter_cubit_bloc_tutorial/data/weather_repository.dart';
import 'bloc_weather_event.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState>{
  final WeatherRepository weatherRepository;

  WeatherBloc({@required WeatherState initialState,
    @required this.weatherRepository}) : super(initialState,){
    on<WeatherEventGet>(
      (event, emit,) async{
        try{
          emit(WeatherStateLoading(),);
          Weather _weather;
          await this.weatherRepository.fetchWeather(event.cityName).then(
            (result) {_weather = result;},
          );
          emit(WeatherStateLoaded(myWeather: _weather),);
        }
        on NetworkException{
          emit(WeatherStateError(errorMessage: "Sorry Please Try Again!",),);
        }
      }
    );
  }
}