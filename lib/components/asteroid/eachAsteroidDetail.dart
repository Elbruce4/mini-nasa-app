import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nasaapp/reUsed/headerPop.dart';

class EachAsteroidDetail extends StatefulWidget {
  const EachAsteroidDetail({Key? key}) : super(key: key);

  @override
  State<EachAsteroidDetail> createState() => _EachAsteroidDetailState();
}

class _EachAsteroidDetailState extends State<EachAsteroidDetail> {

  var info;

  widgetInit () {
    var args = ModalRoute.of(context)!.settings.arguments;
    setState(() {
      info = args;
    });
  }

  @override
  void didChangeDependencies() {
    widgetInit();
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomRight,
          stops: [0.4, 1],
          colors: [Color(0xff0C0A26), Color.fromARGB(255, 60, 49, 179)],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          HeaderPop(),
          Material(
            type: MaterialType.transparency,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                border: Border.all(color: Color.fromARGB(255, 255, 255, 255)),
                borderRadius: BorderRadius.circular(30),
                color: info["is_potentially_hazardous_asteroid"] ? Colors.red : Colors.green
                /* gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomRight,
                  stops: [0.4, 1],
                  colors: [Color.fromARGB(255, 248, 247, 255), Color.fromARGB(255, 60, 49, 179)],
                ) */
              ),
              child: Column(
                children: [
                  Text(
                    'Name: ${info["name"] ?? " "}',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25
                    ),),
                  Text(
                   'Magnitude: ${info["absolute_magnitude_h"].toString()}',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25
                    )),
                  Text(
                   'Min Diamenter: ${info["estimated_diameter"]["kilometers"]["estimated_diameter_min"].toString().substring(0,4)}km',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20
                    )),
                  Text(
                  'Max Diamenter: ${info["estimated_diameter"]["kilometers"]["estimated_diameter_max"].toString().substring(0,4)}km',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20
                  )),
                  Text(
                  'Speed: ${info["close_approach_data"][0]["relative_velocity"]["kilometers_per_hour"].substring(0,8)}km/h',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20
                  )),

                ],
              )
            ),
          )
        ],
      )
    );
  }
}