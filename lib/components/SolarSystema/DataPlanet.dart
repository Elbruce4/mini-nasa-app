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
            color: Color.fromARGB(255, 29, 74, 219),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xff0F69B3), width: 2),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}