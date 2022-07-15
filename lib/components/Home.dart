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
                    NasaAPOD(),
                    NasaDate()
                  ],
                )
              ],
            ),
          ),
        ),
      );
  }
}