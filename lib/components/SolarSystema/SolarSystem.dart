import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:nasaapp/components/SolarSystema/DataPlanet.dart';
import 'package:nasaapp/reUsed/headerPop.dart';

import '../../api/SolarSystem/index.dart';

class SolarSystem extends StatefulWidget {
  const SolarSystem({Key? key}) : super(key: key);

  @override
  State<SolarSystem> createState() => _SolarSystemState();
}

class _SolarSystemState extends State<SolarSystem> {
  var data;
  bool loading = false;

  getPlanets() async {
    setState(() {
      loading = true;
    });
    var info = await getPlanetData(context);
    setState(() {
      data = info;
    });
    setState(() {
      loading = false;
    });
    print(data[0]["mass"]["massValue"]);
    print(data.length);
  }
 
  @override
  void initState() {
    getPlanets();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: loading,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
            stops: [0.4, 1],
            colors: [Color(0xff0C0A26), Color.fromARGB(255, 60, 49, 179)],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const HeaderPop(),
            if(data != null) SingleChildScrollView(
              child: (
                Container(
                  height: 625,
                  child: GridView.count(
                    crossAxisCount: 2,
                    children: [
                      ...data.map((obj) {
                        return DataPlanets(
                          name: obj["name"], 
                          mas :obj["mass"]["massValue"] , 
                          vol: obj["vol"]["volValue"]);
                      })
                    ],
                  ),
                )
              ),
            ),
            //DataPlanets(name: data[0]["name"] , mas : data[0]["mass"]["massValue"] , vol: data[0]["vol"]["volValue"])
          ],
        ),
      ),
    );
  }
}