import 'package:flutter/material.dart';

@immutable
abstract class WeatherEvent {}

class WeatherEventGet extends WeatherEvent {
  final String cityName;

  WeatherEventGet(this.cityName);
}
