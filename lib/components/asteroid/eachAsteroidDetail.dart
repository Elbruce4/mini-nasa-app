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
    super.didChangeDependencies();

  }


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: (int.parse(info["id"]) % 2) == 0 ? AssetImage("assets/ilustrations/asteroid.png") : AssetImage("assets/ilustrations/meteor.png"),
            fit: BoxFit.cover
          )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          HeaderPop(),
          Material(
            type: MaterialType.transparency,
            child: Container(
              width: 300,
              height: 550,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Name: ${info["name"] ?? " "}',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                    ),),
                  Text(
                   'Magnitude: ${info["absolute_magnitude_h"].toString()}',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                    )),
                  Text(
                   'Min Diamenter: ${info["estimated_diameter"]["kilometers"]["estimated_diameter_min"].toString().substring(0,4)}km',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    )),
                  Text(
                  'Max Diamenter: ${info["estimated_diameter"]["kilometers"]["estimated_diameter_max"].toString().substring(0,4)}km',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  )),
                  Text(
                  'Speed: ${info["close_approach_data"][0]["relative_velocity"]["kilometers_per_hour"].substring(0,8)}km/h',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  )),
                  SizedBox(
                    height: 100,
                  ),
                  Container(
                    height: 200,
                    child: Column(
                      children:[ Text(
                      'Can this asteroid crash on earth?',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      )),
                    info["is_potentially_hazardous_asteroid"] ? (
                      Column(
                        children:[
                          Text('Is a little possibillity...',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                            )),
                          Container(
                            width: 150,
                            height: 150,
                            child: Image.asset("assets/ilustrations/earth-crash.png"))
                        ]
                      )
                    )
                    :
                    (
                      Column(
                        children:[
                          Text('No way!',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                            )),
                          Container(
                            width: 150,
                            height: 150,
                            child: Image.asset("assets/ilustrations/meteortie-crash.png"))
                        ]
                      )
                    )
                    ]),
                  ),
                ],
              )
            ),
          )
        ],
      )
    );
  }
}