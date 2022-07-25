
import 'package:nasaapp/api/index.dart';

getPlanetData (context) async {

  try {
    var dio = await getDio(context);
    var response = await dio.get("https://api.le-systeme-solaire.net/rest/bodies/");
    //print(response.data);
    var filterData = response.data["bodies"].where((obj) => obj["isPlanet"] == true).toList();
    print(filterData.runtimeType);
    return filterData;
    
  } catch (e) {
    return e;
  }



}