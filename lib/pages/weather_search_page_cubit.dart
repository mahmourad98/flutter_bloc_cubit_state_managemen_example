import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit_bloc_tutorial/cubit/weather_cubit.dart';
import 'package:flutter_cubit_bloc_tutorial/cubit/weather_state.dart';
import 'package:flutter_cubit_bloc_tutorial/data/model/weather.dart';
import 'package:flutter_cubit_bloc_tutorial/pages/weather_search_page_bloc.dart';

class WeatherSearchPageA extends StatefulWidget {
  @override
  _WeatherSearchPageAState createState() => _WeatherSearchPageAState();
}

class _WeatherSearchPageAState extends State<WeatherSearchPageA> {
  @override
  Widget build(BuildContext context,) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather Search",),
        actions: <Widget>[
          IconButton(
            onPressed: (){
              Navigator.of(context,).push(
                MaterialPageRoute(builder: (_) => WeatherSearchPageB(),),
              );
            },
            icon: Icon(
              Icons.arrow_forward_ios,
              size: 24.0,
            ),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 16,),
        alignment: Alignment.center,
        // child: BlocConsumer<WeatherBloc, WeatherState>(
        //   listener: (context, state) {
        //     if (state is WeatherError) {
        //       Scaffold.of(context).showSnackBar(
        //         SnackBar(
        //           content: Text(state.message),
        //         ),
        //       );
        //     }
        //   },
        //   builder: (context, state) {
        //     if (state is WeatherInitial) {
        //       return buildInitialInput();
        //     } else if (state is WeatherLoading) {
        //       return buildLoading();
        //     } else if (state is WeatherLoaded) {
        //       return buildColumnWithData(state.weather);
        //     } else {
        //       // (state is WeatherError)
        //       return buildInitialInput();
        //     }
        //   },
        // ),
        child: BlocListener<WeatherCubit, WeatherState>(
          listener: (context, state,){
            if (state is WeatherStateError) {
              Scaffold.of(context,).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage,),
                )
              );
            }
          },
          child: BlocBuilder<WeatherCubit, WeatherState>(
            builder: (context, state,){
              if (state is WeatherStateError) {
                return buildInitialInput();
              }
              else if (state is WeatherStateLoading) {
                return buildLoading();
              }
              else if (state is WeatherStateLoaded) {
                return buildColumnWithData(state.myWeather,);
              }
              else {
                // (state is WeatherStateInitial)
                return buildInitialInput();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget buildInitialInput() {
    return Center(
      child: CityInputField(),
    );
  }

  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Column buildColumnWithData(Weather weather,) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
          weather.cityName,
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          // Display the temperature with 1 decimal place
          "${weather.temperatureCelsius.toStringAsFixed(1,)} °C",
          style: TextStyle(fontSize: 80,),
        ),
        CityInputField(),
      ],
    );
  }
}

class CityInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context,) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50,),
      child: TextField(
        onSubmitted: (value,) => submitCityName(context, value.toString(),),
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          hintText: "Enter a city",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12,),),
          suffixIcon: Icon(Icons.search,),
        ),
      ),
    );
  }

  void submitCityName(BuildContext context, String cityName,) {
    final WeatherCubit weatherCubit = BlocProvider.of<WeatherCubit>(context);
    weatherCubit.getWeather(cityName: cityName,);
  }
}
