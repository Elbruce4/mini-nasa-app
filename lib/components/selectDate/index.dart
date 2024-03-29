import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nasaapp/toast/index.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../api/APOD/index.dart';
import '../../dateWidget/index.dart';
import '../../downlader/dowlandImage.dart';
import '../../reUsed/headerPop.dart';
import '../photoWidget.dart/index.dart';

class NasaDate extends StatefulWidget {
  const NasaDate({Key? key}) : super(key: key);

  @override
  State<NasaDate> createState() => _NasaDateState();
}

class _NasaDateState extends State<NasaDate> {

  bool loading = false;
  bool show = false;
  bool showPhoto = false;
  int yearValue = 2022;
  int mounthValue = 4;
  int dayValue = 10;
  Map date = {};
  Map data = {};

  getPick(context , date) async {
    try {
      setState(() {
        loading = true;
      });
      Map copyData = await getPictureOfAnyDay(context , date);
      if(copyData is DioError) {
        showToast("Something went wrong", "error", 5, context);
      } else {
        setState(() {
          data = copyData;
          showPhoto = true;
          loading = false;
        });
      }
      Navigator.pushNamed(
        context,
        '/ImageDetail',
        arguments: data
      );
    } catch (e) {
      showToast("Something went wrong", "error", 5, context);
    }
  }

  @override
  Widget build(BuildContext context) {

    return Material(
      type: MaterialType.transparency,
      child: Container(
        margin: EdgeInsets.only(
          top: 25
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
            stops: [0.2, 1],
            colors: [Color(0xff0C0A26), Color.fromARGB(255, 179, 123, 49)],
          ),
        ),
        child :Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            HeaderPop(),
            SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                "The nasa give us the possibillity to watch the photo of the day of any date you want! Just select your favorite day and watch!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16
                ),),
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
              ],
            ),
            ElevatedButton(
              onPressed: () async {
                setState(() {
                  date["year"] = yearValue;
                  date["mount"] = mounthValue;
                  date["day"] = dayValue;
                });
                await getPick(context , date);
              }, 
              child: Text(
                "Select date",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16
                ),)
              ),
              //if(showPhoto && data.isNotEmpty) PhotoWidget(data)
            ],
        )
    
      ),
    );
  }
}