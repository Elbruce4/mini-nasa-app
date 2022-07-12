import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:numberpicker/numberpicker.dart';

import '../../api/APOD/index.dart';

class NasaDate extends StatefulWidget {
  const NasaDate({Key? key}) : super(key: key);

  @override
  State<NasaDate> createState() => _NasaDateState();
}

class _NasaDateState extends State<NasaDate> {

  bool show = false;
  bool showPhoto = false;
  int yearValue = 2022;
  int mounthValue = 4;
  int dayValue = 10;
  Map date = {};
  Map data = {};

  getPick(context , date) async {
    Map copyData = await getPictureOfAnyDay(context , date);
    if(data is DioError) {
      print("algo salio mal");
    }
    setState(() {
      data = copyData;
    });

  }

  @override
  Widget build(BuildContext context) {

    Widget itemDate({min,max,val,onChange}) {
      return NumberPicker(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xff0F69B3), width: 2)),
        value: val,
        minValue: min,
        maxValue: max,
        textStyle: TextStyle(
          color: Colors.grey,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: "MonserratBlod",
        ),
        selectedTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.bold,
          fontFamily: "MonserratBlod",
        ),
        onChanged: onChange);
    }

    return Container(
      child: !show ?
      ElevatedButton(
        onPressed: () {
          setState(() {
            show = !show;
          });
        }, 
        child: Text(
          "Select a date a see the picture of that day", 
          style: TextStyle(
            fontSize: 16,
            color: Colors.white
          ),))
      :
      Column(
        children: [
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.red)
            ),
            onPressed: () {
              setState(() {
                show = !show;
              });
            },
            child: Text(
              "Hire this", 
              style: TextStyle(
                fontSize: 16,
                color: Colors.white
            ),)),
            Row(
              children: [
                SizedBox(
                  width: 45,
                ),
                itemDate(
                  min: 1950,
                  max: 2022,
                  val: yearValue,
                  onChange: (val) {
                    setState(() {
                      yearValue = val;
                    });
                  }
                ),
                itemDate(
                  min: 1,
                  max: 12,
                  val: mounthValue,
                  onChange: (val) {
                    setState(() {
                      mounthValue = val;
                    });
                  }
                ),
                itemDate(
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
                  showPhoto = true;
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
              if(showPhoto && data.isNotEmpty) (
                Column(
                  children: [
                    Text(
                      data["title"],
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black
                    ),),
                    Text(
                      data["date"],
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black
                    ),),
                    Image.network(
                      data["url"],
                      width: 400,
                      height: 200)

                  ],
                )
              )

        ],
      )

    );
  }
}