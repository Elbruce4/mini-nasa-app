

import '../components/Home.dart';
import '../components/nasaAPOD/index.dart';
import '../components/photoWidget.dart/index.dart';
import '../components/selectDate/index.dart';

getRoutes(context) {
  return {
    '/SelectedDate': (context) => NasaDate(),
    '/ImageDetail': (context) => PhotoWidget(),
  };
}