
import 'package:dio/dio.dart';
import '../index.dart';

getPictireOfTheDay(context) async {
  
  try {
    Dio dio = await getDio(context);
    var response = await dio.get("https://api.nasa.gov/planetary/apod?api_key=3n9xoNbZFuhyurIHQdTs40nDPjYSjQwBC10thskd");
    print(response);
    return response.data;
  } catch (e) {
    return e;
  }

}

getPictureOfAnyDay(context , Map data) async {

  try {
    
    Dio dio = await getDio(context);
    print(data);
    var response = await dio.get("https://api.nasa.gov/planetary/apod?date=${data["year"]}-${data["mount"]}-${data["day"]}&api_key=3n9xoNbZFuhyurIHQdTs40nDPjYSjQwBC10thskd");
    print(response);
    return response;

  } catch (e) {
    return e;
  }

}