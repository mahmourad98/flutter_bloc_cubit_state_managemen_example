import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit_bloc_tutorial/bloc/bloc_weather_bloc.dart';
import 'package:flutter_cubit_bloc_tutorial/connectivity/bloc/connectivity_bloc.dart';
import 'package:flutter_cubit_bloc_tutorial/cubit/weather_cubit.dart';
import 'package:flutter_cubit_bloc_tutorial/cubit/weather_state.dart';
import 'package:flutter_cubit_bloc_tutorial/data/weather_repository.dart';
import 'package:flutter_cubit_bloc_tutorial/pages/weather_search_page_cubit.dart';

import 'connectivity/connectivity_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WeatherCubit>(
          create: (context) => WeatherCubit(
            initialState: WeatherStateInitial(), weatherRepository: FakeWeatherRepository(),),
        ),
        BlocProvider<WeatherBloc>(
          create: (context) => WeatherBloc(
            initialState: WeatherStateInitial(), weatherRepository: FakeWeatherRepository(),),
        ),
        BlocProvider<ConnectivityBloc>(
          create: (context) => ConnectivityBloc(
            ConnectivityInitialState(), ConnectivityService(),),
        ),
      ],
      child: MaterialApp(
        title: 'Material App',
        home: WeatherSearchPageA(),
      ),
    );
  }
}
