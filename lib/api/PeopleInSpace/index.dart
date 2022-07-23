import 'package:dio/dio.dart';

import '../index.dart';

getPeolpleInSpace (context) async {
  try {

    Dio dio = await getDio(context);

    var response = await dio.get("http://api.open-notify.org/astros.json?callback=?");
    
    return(response.data);

    

  } catch (e) {
    return e;
  }
}