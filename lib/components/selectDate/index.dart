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
  Map data = {};

  

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
                  data["year"] = yearValue;
                  data["mount"] = mounthValue;
                  data["day"] = dayValue;
                  print(data);
                });
                await getPictureOfAnyDay(context , data);
                setState(() {
                  
                });
              }, 
              child: Text(
                "Select date",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16
                ),)
              ),
              /* if(!showPhoto) (

              ) */

        ],
      )

    );
  }
}