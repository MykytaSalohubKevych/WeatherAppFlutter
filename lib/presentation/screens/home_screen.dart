import 'dart:math';

import 'package:flutter/material.dart';
import '../../data/util/constants.dart';
import '../bloc/weather_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController editingController = TextEditingController();
    ThemeBuilder themeData = ColorTheme.cloudyOne;
    double height = MediaQuery
        .of(context)
        .size
        .height;
    double width = MediaQuery
        .of(context)
        .size
        .width;

    return Scaffold(body: BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        if (state is WeatherHasData) {
          switch (state.result.cond.toString()[0]) {
            case '2':
              themeData = ColorTheme.rainyTwo;
              break;
            case '3':
              themeData = ColorTheme.rainyThree;
              break;
            case '5':
              themeData = ColorTheme.rainyOne;
              break;
            case '6':
              themeData = ColorTheme.snowyTwo;
              break;
            case '7':
              themeData = ColorTheme.cloudyOne;
              break;
            case '8':
              if (state.result.cond.toString() == '800') {
                themeData = ColorTheme.sunnyOne;
              } else {
                themeData = ColorTheme.cloudyTwo;
              }
              break;
            default:
              themeData = ColorTheme.cloudyOne;
          }
        }
        return state is WeatherLoading
            ? const Center(child: CircularProgressIndicator())
            : state is WeatherHasData
            ? Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                color: themeData.blackShade,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/${themeData.bg}.png'))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: width * 0.1, vertical: height * 0.05),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: Colors.white.withOpacity(0.2),
                  ),
                  child: Image.asset('assets/logo.png'),
                ),
                Container(
                  width: width * 0.8,
                  height: height * 0.425,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: themeData.primary),
                  child: Center(
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Flexible(
                                  child: Image.network(
                                    'https://openweathermap.org/img/wn/${state
                                        .result.icon}@2x.png',
                                    color: themeData.secondary,
                                  )),
                              Text(
                                '${state.result.temperature}°C',
                                style: TextStyle(
                                    fontSize: Theme
                                        .of(context)
                                        .textTheme
                                        .displayMedium!
                                        .fontSize,
                                    color: themeData.secondary),
                              )
                            ],
                          ),
                          SizedBox(
                            height: height * 0.0001,
                          ),
                          Text(
                            state.result.weather,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: Theme
                                    .of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .fontSize,
                                color: themeData.secondary),
                          ),
                          SizedBox(
                            height: height * 0.001,
                          ),
                          TextButton(
                            style: ButtonStyle(
                                shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(12),
                                        side: BorderSide(
                                            color: themeData.secondary,
                                            width: 0.5)))),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) =>
                                      AlertDialog(
                                        title: const Text('Change city'),
                                        content: Container(
                                          padding: const EdgeInsets.only(
                                              left: 12),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(12),
                                            border: Border.all(
                                                color: themeData.secondary),
                                          ),
                                          child: TextField(
                                            decoration:
                                            const InputDecoration(
                                              hintText: 'Type your city...',
                                              border: InputBorder.none,
                                            ),
                                            controller: editingController,
                                          ),
                                        ),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text('Cancel')),
                                          TextButton(
                                              onPressed: () {
                                                if (editingController
                                                    .text.isNotEmpty) {
                                                  context.read<WeatherBloc>()
                                                      .add(OnCityChanged(
                                                      editingController.text
                                                          .trim()));
                                                }
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text('Submit'))
                                        ],
                                      ));
                            },
                            child: Text(
                              state.result.cityName,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: Theme
                                      .of(context)
                                      .textTheme
                                      .titleLarge!
                                      .fontSize,
                                  color: themeData.secondary),
                            ),
                          ),
                          SizedBox(height: height * 0.006),
                          Text(
                            state.result.date,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: Theme
                                    .of(context)
                                    .textTheme
                                    .titleLarge!
                                    .fontSize,
                                color: themeData.secondary),
                          ),
                          SizedBox(
                            height: height * 0.03,
                          ),
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30.0),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'Min: ${state.result.minTemperature}°C',
                                    // get from state
                                    style: TextStyle(
                                        fontSize: Theme
                                            .of(context)
                                            .textTheme
                                            .titleMedium!
                                            .fontSize,
                                        color: themeData.secondary),
                                  ),
                                  Container(
                                    width: 2,
                                    height: 20,
                                    color: themeData.secondary,
                                  ),
                                  Text(
                                    'Max: ${state.result.maxTemperature}°C',
                                    // get from state
                                    style: TextStyle(
                                        fontSize: Theme
                                            .of(context)
                                            .textTheme
                                            .titleMedium!
                                            .fontSize,
                                        color: themeData.secondary),
                                  ),
                                  Container(
                                    width: 2,
                                    height: 20,
                                    color: themeData.secondary,
                                  ),
                                  Text(
                                    'Feels like: ${state.result
                                        .feelTemperature}°C',
                                    // get from state
                                    style: TextStyle(
                                        fontSize: Theme
                                            .of(context)
                                            .textTheme
                                            .titleMedium!
                                            .fontSize,
                                        color: themeData.secondary),
                                  )
                                ],
                              )),
                          SizedBox(height: height * 0.006),
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 50.0),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: [
                                  Flexible(
                                      child: Text(
                                        'Sunrise at ${state.result.sunrise} am',
                                        style: TextStyle(
                                            fontSize: Theme
                                                .of(context)
                                                .textTheme
                                                .titleMedium!
                                                .fontSize,
                                            color: themeData.secondary),
                                      )),
                                  Flexible(
                                      child: Container(
                                          width: 2,
                                          height: 20,
                                          color: themeData.secondary)),
                                  Flexible(
                                      child: Text(
                                        'Sunset at ${state.result.sunset} pm',
                                        style: TextStyle(
                                            fontSize: Theme
                                                .of(context)
                                                .textTheme
                                                .titleMedium!
                                                .fontSize,
                                            color: themeData.secondary),
                                      ))
                                ],
                              )),
                          SizedBox(height: height * 0.0008),
                        ],
                      )),
                ),
                const SizedBox(height: 64),
                const Spacer()
              ],
            ))
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo.png'),
            const Center(
                child: Text('Enter city name to get weather data')),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.only(left: 12),
              margin: const EdgeInsets.symmetric(horizontal: 24),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: themeData.secondary)),
              child: TextField(
                decoration: const InputDecoration(
                    hintText: 'Type city name...',
                    border: InputBorder.none),
                controller: editingController,
              ),
            ),



            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 24),
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: const MaterialStatePropertyAll(
                      Color(0xFF009AFF),
                    ),
                    shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(12)))),
                onPressed: () {
                  context.read<WeatherBloc>().add(
                      OnCityChanged(editingController.text.trim()));
                },
                child: const Text('Tell me the weather'),
              ),
            )

          ],
        );
      },
    ));
  }
}
