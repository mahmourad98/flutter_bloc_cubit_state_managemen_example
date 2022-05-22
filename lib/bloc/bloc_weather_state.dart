import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cubit_bloc_tutorial/data/model/weather.dart';

@immutable
abstract class WeatherState extends Equatable{}

class WeatherStateInitial extends WeatherState{
  @override
  List<Object> get props => <dynamic>[];
}
class WeatherStateLoading extends WeatherState{
  @override
  List<Object> get props => <dynamic>[];
}
class WeatherStateLoaded extends WeatherState{
  final Weather myWeather;

  WeatherStateLoaded({@required this.myWeather,});

  @override
  List<Object> get props => <dynamic>[myWeather,];
}

class WeatherStateError extends WeatherState{
  final String errorMessage;

  WeatherStateError({@required this.errorMessage,});

  @override
  List<Object> get props => <dynamic>[errorMessage,];
}