import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nasaapp/reUsed/headerPop.dart';

class DetailPlanet extends StatefulWidget {
  const DetailPlanet();

  @override
  State<DetailPlanet> createState() => _DetailPlanetState();
}

class _DetailPlanetState extends State<DetailPlanet> {

  var data;

  takeData() async {
    var info = ModalRoute.of(context)!.settings.arguments;//saco los argumentos que paso por ruta;
    setState(() {
      data = info;
    });
    print(data);
  }

  @override
  void didChangeDependencies() {
    takeData();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 29, 74, 219),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xff0F69B3), width: 2),
      ),
      child: Material(
        type: MaterialType.transparency,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            HeaderPop(),
            
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${data["name"]}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 45
                  ),),
                  data["moons"] != null ? 
                  Text(
                    "Moons: ${data["moons"].length}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30
                    ),)
                  :
                  (
                  Text(
                    "This planet has not any moon",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30
                    ),)),
                  Text(
                    "Gravity: ${data["gravity"]}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30
                  ),),
                  Text(
                    "Gravity: ${data["density"]}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30
                  ),),
                  Text(
                    "Mass: ${data["mass"]["massValue"]}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30
                  ),),
                  Text(
                    "Mass: ${data["vol"]["volValue"]}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30
                  ),),
                  Text(
                    "Inclination: ${data["inclination"]}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30
                  ),),
                  data["discoveryDate"] != "" ? Container(
                    child: (
                    Column(
                      children: [
                        Text(
                          "Discover by: ${data["discoveredBy"]}",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20
                        ),),
                        Text(
                          "Discover on: ${data["discoveryDate"]}",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20
                        )
                        ),
                      ],
                    )
                    
                    ),
                  )
                  :
                  Center(
                    child: (
                    Text(
                      "No info abaout who or when this planet was discover",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20
                      ),)),
                  ),
                  Text(
                    "Radio: ${data["meanRadius"]}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30
                  ),),
      
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}