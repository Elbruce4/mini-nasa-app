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
    if(info != null) {
    setState(() {
      data = info;
    });
    }
    print(data["image"]);
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
        image: DecorationImage(
          image: AssetImage(data["image"]),
          fit: BoxFit.cover
        )
      ),
      child: Material(
        type: MaterialType.transparency,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            HeaderPop(),
            
            Container(
              height: 500,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${data["name"]}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 45,
                      fontWeight: FontWeight.bold
                  ),),
                  data["moons"] != null ? 
                  Text(
                    "Moons: ${data["moons"].length}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),)
                  :
                  (
                  Text(
                    "This planet has not any moon",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      
                      fontWeight: FontWeight.bold
                    ),)),
                  Text(
                    "Gravity: ${data["gravity"]} m/s²",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      
                      fontWeight: FontWeight.bold
                  ),),
                  Text(
                    "Density: ${data["density"]} gr/cm3",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      
                      fontWeight: FontWeight.bold
                  ),),
                  Text(
                    "Mass: ${data["mass"]["massValue"]}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      
                      fontWeight: FontWeight.bold
                  ),),
                  Text(
                    "Vol: ${data["vol"]["volValue"]}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      
                      fontWeight: FontWeight.bold
                  ),),
                  Text(
                    "Inclination: ${data["inclination"]}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      
                      fontWeight: FontWeight.bold
                  ),),
                  data["discoveryDate"] != "" ? Container(
                    child: (
                    Column(
                      children: [
                        Center(
                          child: Text(
                            "Discover by: ${data["discoveredBy"]}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold
                          ),),
                        ),
                        Center(
                          child: Text(
                            "Discover on: ${data["discoveryDate"]}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold
                          )
                          ),
                        ),
                      ],
                    )
                    
                    ),
                  )
                  :
                  Center(
                    child: (
                    Text(
                      "No info about who or when this planet was discover",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15
                      ),)),
                  ),
                  Text(
                    "Radio: ${data["meanRadius"]}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      
                      fontWeight: FontWeight.bold
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