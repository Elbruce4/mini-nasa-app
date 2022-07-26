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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const HeaderPop(),
            Material(
              type: MaterialType.transparency,
              child: Container(
                margin: EdgeInsets.only(
                  left: 15,
                  bottom: 20,
                  top: 10
                ),
                child: Text(
                  "Watch all detail info abaout your favorite planet of the solar system",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16
                  ),
                ),
              ),
            ),
            if(data != null) SingleChildScrollView(
              child: (
                Container(
                  height: 550,
                  child: GridView.count(
                    crossAxisCount: 2,
                    children: [
                      ...data.map((obj) {
                        return DataPlanets(
                          name: obj["englishName"],
                          data: obj);
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