import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nasaapp/components/selectDate/index.dart';

import 'nasaAPOD/index.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Widget Card ({route ,  title}) {
    
    return Container(
      width: 160,
      height: 160,
      decoration: BoxDecoration(
        color: Color.fromRGBO(37, 32, 87, 0.5),
        border: Border.all(color: const Color(0xff252057)),
        borderRadius: BorderRadius.circular(30)
      ),
      child: ElevatedButton(
        onPressed: route,
        child: Text(
          title, 
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white
          ),)),
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
            height: 1000,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 400,
                  height: 200,
                  margin: EdgeInsets.only(
                    left: 25
                  ),
                  child: Image.asset("assets/ilustrations/nasaLogo.png"),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Card(
                      title: "See pic of the day",
                      route: () {
                        Navigator.pushNamed(context, "/PictureOfDay");
                      }
                    ),
                    Card(
                      title: "Select a date to see a special date",
                      route: () {
                        Navigator.pushNamed(context, "/SelectedDate");
                      }
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