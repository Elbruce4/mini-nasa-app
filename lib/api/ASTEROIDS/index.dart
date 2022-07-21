
import 'package:dio/dio.dart';

import '../index.dart';

getAsteroidsOfOneDate (context , Map date) async {
  try {
    Dio dio = await getDio(context);
    print(date);
    var response = await dio.get("https://api.nasa.gov/neo/rest/v1/feed?start_date=${date["year"]}-${date["mount"]}-${date["day"]}&end_date=${date["year"]}-${date["mount"]}-${date["day"]}&api_key=3n9xoNbZFuhyurIHQdTs40nDPjYSjQwBC10thskd");

    return response.data;
  
  } catch (e) {
    return e;
  }
}