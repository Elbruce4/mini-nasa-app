

import '../components/nasaAPOD/index.dart';
import '../components/selectDate/index.dart';

getRoutes(context) {
  return {
    '/PictureOfDay': (context) => NasaAPOD(),
    '/SelectedDate': (context) => NasaDate(),
  };
}