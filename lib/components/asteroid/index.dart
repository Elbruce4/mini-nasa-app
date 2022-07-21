import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:nasaapp/components/asteroid/detailEachAsteroid.dart';
import 'package:nasaapp/components/asteroid/startAndEndDate.dart';

import '../../reUsed/headerPop.dart';
import '../selectDate/index.dart';

class NearAstheroid extends StatefulWidget {
  const NearAstheroid({Key? key}) : super(key: key);

  @override
  State<NearAstheroid> createState() => _NearAstheroidState();
}

class _NearAstheroidState extends State<NearAstheroid> {

  var info;
  bool loading = false;
  var date;

  widgetInit () async {
    setState(() {
      loading = true;
    });
    var inforCopy = ModalRoute.of(context)!.settings.arguments;
    if(inforCopy != null) {
      setState(() {
        info = inforCopy;
        date = '${info["date"]["year"]}-${info["date"]["mount"]}-${info["date"]["day"]}';
        print(date);
        print('date: ${info["data"]["near_earth_objects"].values.elementAt(0)}');
      });
      setState(() {
        loading = false;
      });
    }

  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    widgetInit();
  }

  @override
  void initState() {
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 25
      ),
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
          LoadingOverlay(
            isLoading: loading,
            child: Material(
              type: MaterialType.transparency,
              child: Column(
                children: [
                  GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                   "Asteroids founded on that date: ${info["data"]["element_count"]}", 
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30
                    ),
                  ),
                ), 
                SingleChildScrollView(
                  child: Container(
                    height: 550,
                    child: GridView.count(
                      crossAxisCount: 2,
                      children: [
                          ...info["data"]["near_earth_objects"].values.elementAt(0).map(
                            (obj) {
                              return DetailAsteroids(
                                id: obj["id"],
                                name: obj["name"]
                              );
                            })
                      ],
                    ),
                  ),
                )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}