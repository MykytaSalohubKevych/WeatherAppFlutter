import 'package:flutter/material.dart';
import '../../data/util/constants.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController editingController = TextEditingController();
    ThemeBuilder themeData = ColorTheme.cloudyOne;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Container(
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
                const SizedBox(height: 20), // Adjust this spacing as needed
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: width * 0.1, vertical: height * 0.05),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                  ),
                  child: Image.asset('assets/logo.png'),
                ),
                Container(
                  width: width * 0.8,
                  height: height * 0.425,
                  decoration: BoxDecoration(
                      color: themeData.primary),
                  child: ListView(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                              'https://openweathermap.org/img/wn/10d@2x.png',
                              color: themeData.secondary), // get from state
                          Text(
                            '30°C',
                            style: TextStyle(
                                fontSize: Theme.of(context)
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
                        'Sunny',
                        style: TextStyle(
                            fontSize: Theme.of(context)
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
                                    side: BorderSide(
                                        color: themeData.secondary, width: 0.5)))),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: const Text('Change city'),
                                    content: Container(
                                      padding: const EdgeInsets.only(left: 12),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: themeData.secondary),
                                      ),
                                      child: TextField(
                                        decoration: const InputDecoration(
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
                                              // get data from state
                                            }
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('Submit'))
                                    ],
                                  ));
                        },
                        child: Text(
                          'Lviv',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .fontSize,
                              color: themeData.secondary),
                        ),
                      ),
                      SizedBox(height: height * 0.006),
                      Text(
                        '01 01 2024',
                        style: TextStyle(
                            fontSize: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .fontSize,
                            color: themeData.secondary),
                      ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Min:...', // get from state
                                style: TextStyle(
                                    fontSize: Theme.of(context)
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
                                'Max...', // get from state
                                style: TextStyle(
                                    fontSize: Theme.of(context)
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
                                'Feels like...', // get from state
                                style: TextStyle(
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .fontSize,
                                    color: themeData.secondary),
                              )
                            ],
                          )),
                      SizedBox(height: height * 0.06),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Sunrise at...',
                                style: TextStyle(
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .fontSize,
                                    color: themeData.secondary),
                              ),
                              Container(
                                  width: 2,
                                  height: 20,
                                  color: themeData.secondary),
                              Text(
                                'Sunset at...',
                                style: TextStyle(
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .fontSize,
                                    color: themeData.secondary),
                              )
                            ],
                          )),
                      SizedBox(height: height * 0.0008),
                    ],
                  ),
                ),
                const SizedBox(height: 64),
                const Spacer()
              ],
            )));
  }
}

Widget RowWithWeatherDataInContainer(
    ThemeBuilder themeData, BuildContext context) {
  return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
    Image.network('https://openweathermap.org/img/wn/10d@2x.png',
        color: themeData.secondary), // get from state
    Text(
      '30°C',
      style: TextStyle(
          fontSize: Theme.of(context).textTheme.displayMedium!.fontSize,
          color: themeData.secondary),
    )
  ]);
}
