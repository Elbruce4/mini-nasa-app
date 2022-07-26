import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nasaapp/components/selectDate/index.dart';
import 'package:nasaapp/storage/index.dart';

import 'nasaAPOD/index.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Widget Card ({event ,  title , img , backColor}) {
    return Container(
      margin: EdgeInsets.all(10),
      width: 170,
      height: 230,
      decoration: new BoxDecoration(
        color: Color.fromARGB(125, 17, 235, 162),
        border: Border.all(color: Color(0xff252057)), // 0EEEC1
        borderRadius: BorderRadius.circular(50)
      ),
      child: ElevatedButton(
        onPressed: event,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children:[
            SizedBox(
              width: 100,
              height: 100,
              child: Image.asset(img),
            ),
            Text(
              title, 
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white
            ),),

          ]
        )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomRight,
                stops: [0.4, 1],
                colors: [Color(0xff0C0A26), Color.fromARGB(255, 60, 49, 179)],
              ),
            ),
            width: 500,
            height: 700,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 400,
                  height: 200,
                  margin: EdgeInsets.only(
                    left: 25,
                  ),
                  child: Image.asset("assets/ilustrations/nasaLogo.png"),
                ),
                Wrap(
                  children: [
                    Card(
                      title: "See pic of the dayy",
                      event: () async {
                        Navigator.pushNamed(context, "/ImageDetail");
                        await writeData("picOfDay", "pic");
                      },
                      img: "assets/ilustrations/worlwide.png"
                    ),
                    Card(
                      title: "Select a date to see a special date",
                      event: () async {
                        Navigator.pushNamed(context, "/SelectedDate");
                        await writeData("selectDate", "pic");
                      },
                      img: "assets/ilustrations/rocket.png"
                    ),
                    Card(
                      title: "Watch near earths asteroid data according to date",
                      event: () async {
                        Navigator.pushNamed(context, "/DateNearAsteroids");
                      },
                      img: "assets/ilustrations/meteorite.png"
                    ),/* 
                    Card(
                      title: "Home many peolple are in the space rigth now?",
                      event: () async {
                        Navigator.pushNamed(context, "/PeopleInSpace");
                      }
                    ), */
                    Card(
                      title: "Solar System Planet data",
                      event: () async {
                        Navigator.pushNamed(context, "/SolarSystem");
                      },
                      img: "assets/ilustrations/alien.png"
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      );
  }
}