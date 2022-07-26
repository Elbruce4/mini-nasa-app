import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:nasaapp/dateWidget/index.dart';

import '../../api/ASTEROIDS/index.dart';
import '../../reUsed/headerPop.dart';
import '../../toast/index.dart';

class SelectDate extends StatefulWidget {
  const SelectDate({Key? key}) : super(key: key);

  @override
  State<SelectDate> createState() => _SelectDateState();
}

class _SelectDateState extends State<SelectDate> {
  
  int yearValue = 2022;
  int mounthValue = 4;
  int dayValue = 10;
  Map data = {};
  Map date = {};
  bool loading = false;

  getPick(context , date) async {
    setState(() {
      loading = true;
    });
    try {
      Map copyData = await getAsteroidsOfOneDate(context , date);
      if(copyData is DioError) {
        showToast("Something went wrong", "error", 5, context);
      } else {
        setState(() {
          data = copyData;
        });
      }
      Navigator.pushNamed(
        context,
        '/Asteroids',
        arguments: {
          "data" : data,
          "date" : date
          }
      );
      setState(() {
        loading = false;
      });
    } catch (e) {
      showToast("Something went wrong", "error", 5, context);
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: loading,
      child: Container(
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
        child :Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            HeaderPop(),
            SizedBox(
              height: 30,
            ),
            Material(
              type: MaterialType.transparency,
              child: Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  "In this space you can access to info abaout asterois which pass near our planet on an specific date!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16
                  ),),
              ),
            ),
            SizedBox(
              height: 90,
            ),
            Row(
              children: [
                SizedBox(
                  width: 45,
                ),
                Dates(
                  type: "Year",
                  min: 1996,
                  max: 2022,
                  val: yearValue,
                  onChange: (val) {
                    setState(() {
                      yearValue = val;
                    });
                  }
                ),
                Dates(
                  type: "Mounth",
                  min: 1,
                  max: 12,
                  val: mounthValue,
                  onChange: (val) {
                    setState(() {
                      mounthValue = val;
                    });
                  }
                ),
                Dates(
                  type: "Day",
                  min: 1,
                  max: 31,
                  val: dayValue,
                  onChange: (val) {
                    setState(() {
                      dayValue = val;
                    });
                  }
                ),
          ]),
          RaisedButton(
            child: Text("Select date"),
            onPressed: () async {
              setState(() {
                  date["year"] = yearValue;
                  date["mount"] = mounthValue;
                  date["day"] = dayValue;
                });
                await getPick(context , date);
            })
      ])
      ),
    );
  }
}