

import '../components/Home.dart';
import '../components/SolarSystema/SolarSystem.dart';
import '../components/asteroid/eachAsteroidDetail.dart';
import '../components/asteroid/index.dart';
import '../components/asteroid/startAndEndDate.dart';
import '../components/nasaAPOD/index.dart';
import '../components/peopleOnSpace/index.dart';
import '../components/photoWidget.dart/index.dart';
import '../components/selectDate/index.dart';

getRoutes(context) {
  return {
    '/SelectedDate': (context) => NasaDate(),
    '/ImageDetail': (context) => PhotoWidget(),
    '/DateNearAsteroids': (context) => SelectDate(),
    '/Asteroids': (context) => NearAstheroid(),
    '/EachAsteroidDetail': (context) => EachAsteroidDetail(),
    '/PeopleInSpace': (context) => PeolpleInSpace(),
    '/SolarSystem': (context) => SolarSystem()
  };
}