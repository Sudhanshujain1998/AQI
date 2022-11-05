import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    String cityName = "Kota, Rajasthan"; //city name
    int aqi = 70; // currunt AQI
    int aqiPara = 35; //AQI Parameters

    int currTemp = 30; // current temperature
    int maxTemp = 30; // today max temperature
    int minTemp = 2; // today min temperature
    Size size = MediaQuery.of(context).size;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return Scaffold(
      body: Center(
        child: Container(
          height: size.height,
          width: size.height,
          decoration: BoxDecoration(
            color: isDarkMode ? Colors.black : Colors.white,
            image: const DecorationImage(
              image: AssetImage("assets/images/pol.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: size.height * 0.01,
                          horizontal: size.width * 0.05,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.bars,
                              color: isDarkMode ? Colors.white : Colors.black,
                            ),
                            Align(
                              child: Text(
                                'Air Quality Index',
                                style: GoogleFonts.questrial(
                                  color: isDarkMode
                                      ? Colors.white
                                      : const Color(0xff1D1617),
                                  fontSize: size.height * 0.02,
                                ),
                              ),
                            ),
                            FaIcon(
                              FontAwesomeIcons.searchLocation,
                              color: isDarkMode ? Colors.white : Colors.black,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: size.height * 0.03,
                        ),
                        child: Align(
                          child: Text(
                            cityName,
                            style: GoogleFonts.questrial(
                              color: isDarkMode ? Colors.white : Colors.black,
                              fontSize: size.height * 0.06,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: size.height * 0.005,
                        ),
                        child: Align(
                          child: Text(
                            'AQI Today', //day
                            style: GoogleFonts.questrial(
                              color:
                                  isDarkMode ? Colors.white54 : Colors.black54,
                              fontSize: size.height * 0.035,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: size.height * 0.03,
                        ),
                        child: Align(
                          child: Text(
                            '$aqi', //curent temperature
                            style: GoogleFonts.questrial(
                              color: currTemp <= 0
                                  ? Colors.blue
                                  : currTemp > 0 && currTemp <= 15
                                      ? Colors.indigo
                                      : currTemp > 15 && currTemp < 30
                                          ? Colors.deepPurple
                                          : Colors.pink,
                              fontSize: size.height * 0.13,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.25),
                        child: Divider(
                          color: isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: size.height * 0.005,
                        ),
                        child: Align(
                          child: Text(
                            'MODERATE', // weather
                            style: GoogleFonts.questrial(
                              color: isDarkMode ? Colors.white : Colors.black54,
                              fontSize: size.height * 0.033,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: size.height * 0.03,
                          bottom: size.height * 0.01,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.teal,
                                fixedSize: Size.fromWidth(180),
                                padding: EdgeInsets.all(10),
                              ),
                              child: Text(
                                '$aqiParaµg/m³ / $aqiµg/m³',
                                style: GoogleFonts.questrial(
                                  color: Colors.black,
                                  fontSize: size.height * 0.02,
                                ),
                              ),
                              onPressed: () {
                                //Code Here
                              },
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.05,
                          vertical: size.height * 0.02,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                            color: Colors.white.withOpacity(0.05),
                          ),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    top: size.height * 0.02,
                                    left: size.width * 0.03,
                                  ),
                                  child: Text(
                                    'Least Polluted City ',
                                    style: GoogleFonts.questrial(
                                      color: isDarkMode
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: size.height * 0.025,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Divider(
                                color: isDarkMode ? Colors.white : Colors.black,
                              ),
                              Padding(
                                padding: EdgeInsets.all(size.width * 0.005),
                                child: Column(
                                  children: [
                                    //TODO: change weather forecast from local to api get
                                    LeastPolluted(
                                      "Zurich, Switzerland", //city
                                      minTemp,
                                      maxTemp,
                                      size,
                                      isDarkMode,
                                    ),
                                    LeastPolluted(
                                      "Hobart, Australia ",
                                      -5,
                                      5,
                                      size,
                                      isDarkMode,
                                    ),
                                    LeastPolluted(
                                      "Reykjavik, Iceland",
                                      -2,
                                      7,
                                      size,
                                      isDarkMode,
                                    ),
                                    LeastPolluted(
                                      "Launceston, Australia",
                                      3,
                                      10,
                                      size,
                                      isDarkMode,
                                    ),
                                    LeastPolluted(
                                      "Honolulu, US",
                                      5,
                                      12,
                                      size,
                                      isDarkMode,
                                    ),
                                    LeastPolluted(
                                      "Vitoria, Brazil",
                                      4,
                                      7,
                                      size,
                                      isDarkMode,
                                    ),
                                    LeastPolluted(
                                      "Bergen, Norway",
                                      -2,
                                      1,
                                      size,
                                      isDarkMode,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.05,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                            color: isDarkMode
                                ? Colors.white.withOpacity(0.05)
                                : Colors.black.withOpacity(0.05),
                          ),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    top: size.height * 0.01,
                                    left: size.width * 0.03,
                                  ),
                                  child: Text(
                                    'Forecast for today',
                                    style: GoogleFonts.questrial(
                                      color: isDarkMode
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: size.height * 0.025,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(size.width * 0.005),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      //TODO: change weather forecast from local to api get
                                      buildForecastToday(
                                        "Now", //hour
                                        currTemp, //temperature
                                        20, //wind (km/h)
                                        0, //rain chance (%)
                                        FontAwesomeIcons.sun, //weather icon
                                        size,
                                        isDarkMode,
                                      ),
                                      buildForecastToday(
                                        "15:00",
                                        1,
                                        10,
                                        40,
                                        FontAwesomeIcons.cloud,
                                        size,
                                        isDarkMode,
                                      ),
                                      buildForecastToday(
                                        "16:00",
                                        0,
                                        25,
                                        80,
                                        FontAwesomeIcons.cloudRain,
                                        size,
                                        isDarkMode,
                                      ),
                                      buildForecastToday(
                                        "17:00",
                                        -2,
                                        28,
                                        60,
                                        FontAwesomeIcons.snowflake,
                                        size,
                                        isDarkMode,
                                      ),
                                      buildForecastToday(
                                        "18:00",
                                        -5,
                                        13,
                                        40,
                                        FontAwesomeIcons.cloudMoon,
                                        size,
                                        isDarkMode,
                                      ),
                                      buildForecastToday(
                                        "19:00",
                                        -8,
                                        9,
                                        60,
                                        FontAwesomeIcons.snowflake,
                                        size,
                                        isDarkMode,
                                      ),
                                      buildForecastToday(
                                        "20:00",
                                        -13,
                                        25,
                                        50,
                                        FontAwesomeIcons.snowflake,
                                        size,
                                        isDarkMode,
                                      ),
                                      buildForecastToday(
                                        "21:00",
                                        -14,
                                        12,
                                        40,
                                        FontAwesomeIcons.cloudMoon,
                                        size,
                                        isDarkMode,
                                      ),
                                      buildForecastToday(
                                        "22:00",
                                        -15,
                                        1,
                                        30,
                                        FontAwesomeIcons.moon,
                                        size,
                                        isDarkMode,
                                      ),
                                      buildForecastToday(
                                        "23:00",
                                        -15,
                                        15,
                                        20,
                                        FontAwesomeIcons.moon,
                                        size,
                                        isDarkMode,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildForecastToday(String time, int temp, int wind, int rainChance,
      IconData weatherIcon, size, bool isDarkMode) {
    return Padding(
      padding: EdgeInsets.all(size.width * 0.025),
      child: Column(
        children: [
          Text(
            time,
            style: GoogleFonts.questrial(
              color: isDarkMode ? Colors.white : Colors.black,
              fontSize: size.height * 0.02,
            ),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: size.height * 0.005,
                ),
                child: FaIcon(
                  weatherIcon,
                  color: isDarkMode ? Colors.white : Colors.black,
                  size: size.height * 0.03,
                ),
              ),
            ],
          ),
          Text(
            '$temp˚C',
            style: GoogleFonts.questrial(
              color: isDarkMode ? Colors.white : Colors.black,
              fontSize: size.height * 0.025,
            ),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: size.height * 0.01,
                ),
                child: FaIcon(
                  FontAwesomeIcons.wind,
                  color: Colors.grey,
                  size: size.height * 0.03,
                ),
              ),
            ],
          ),
          Text(
            '$wind km/h',
            style: GoogleFonts.questrial(
              color: Colors.grey,
              fontSize: size.height * 0.02,
            ),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: size.height * 0.01,
                ),
                child: FaIcon(
                  FontAwesomeIcons.umbrella,
                  color: Colors.blue,
                  size: size.height * 0.03,
                ),
              ),
            ],
          ),
          Text(
            '$rainChance %',
            style: GoogleFonts.questrial(
              color: Colors.blue,
              fontSize: size.height * 0.02,
            ),
          ),
        ],
      ),
    );
  }

  Widget LeastPolluted(
      String time, int minTemp, int maxTemp, size, bool isDarkMode) {
    return Padding(
      padding: EdgeInsets.all(
        size.height * 0.005,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.02,
                ),
                child: Text(
                  time,
                  style: GoogleFonts.questrial(
                    color: isDarkMode ? Colors.white : Colors.black,
                    fontSize: size.height * 0.025,
                  ),
                ),
              ),
              Align(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: size.width * 0.15,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.05,
                  ),
                  child: Text(
                    '$maxTemp µg/m3',
                    style: GoogleFonts.questrial(
                      color: isDarkMode ? Colors.white : Colors.black,
                      fontSize: size.height * 0.025,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Divider(
            color: isDarkMode ? Colors.white : Colors.black,
          ),
        ],
      ),
    );
  }
}
