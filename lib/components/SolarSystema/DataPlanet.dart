import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DataPlanets extends StatefulWidget {
  var name;
  var data;

  DataPlanets(
    {
      required this.name,
      required this.data,
    }
  );

  @override
  State<DataPlanets> createState() => _DataPlanetsState();
}

class _DataPlanetsState extends State<DataPlanets> {
  var image;

  selectColor () {
    switch (widget.name) {
      case "Jupiter":
        setState(() {
          image = "assets/ilustrations/jupiter.png";
        });
        break;
      case "Neptune":
        setState(() {
          image = "assets/ilustrations/neptune.png";
        });
        break;
      case "Uranus":
        setState(() {
          image = "assets/ilustrations/uranus.png";
        });
        break;
      case "Earth":
        setState(() {
          image = "assets/ilustrations/planet-earth.png";
        });
        break;
      case "Venus":
        setState(() {
          image = "assets/ilustrations/venus.png";
        });
        break;
      case "Mercury":
        setState(() {
          image = "assets/ilustrations/mercury.png";
        });
        break;
      case "Mars":
        setState(() {
          image = "assets/ilustrations/mars.png";
        });
        break;
      case "Saturn":
        setState(() {
          image = "assets/ilustrations/saturn.png";
        });
        break;
      default:
        setState(() {
          image = "0xff00b7ee";
        });
    }
  }

  @override
  void initState() {
    selectColor();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context, 
            "/DetailPlanet",
            arguments: widget.data
          );
        },
        child: Container(
          margin: EdgeInsets.all(10),
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover
            ),
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: const Color(0xff0F69B3), width: 2), //urano: 255, 115, 183, 238 // 45, 47, 184
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.bold
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}