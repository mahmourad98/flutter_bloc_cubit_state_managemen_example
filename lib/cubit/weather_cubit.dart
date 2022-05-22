import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cubit_bloc_tutorial/cubit/weather_state.dart';
import 'package:flutter_cubit_bloc_tutorial/data/model/weather.dart';
import 'package:flutter_cubit_bloc_tutorial/data/weather_repository.dart';

class WeatherCubit extends Cubit<WeatherState>{
  final WeatherRepository weatherRepository;

  WeatherCubit({@required WeatherState initialState,
    @required this.weatherRepository}) : super(initialState,);

  Future getWeather({@required String cityName,}) async{
    try{
      emit(WeatherStateLoading(),);
      Weather _weather;
      await this.weatherRepository.fetchWeather(cityName).then(
          (result) {_weather = result;},
      );
      emit(WeatherStateLoaded(myWeather: _weather),);
    }
    on NetworkException{
      emit(WeatherStateError(errorMessage: "Sorry Please Try Again!",),);
    }
  }
}