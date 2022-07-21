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

    return Container(
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
          Container(
            margin: EdgeInsets.only(
              left: 25
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                      width: 50,
                      margin: EdgeInsets.only(
                          right: 20),
                      child: SvgPicture.asset(
                        'assets/icons/BackButton.svg',
                      )),
                ),
                Image.asset(
                  "assets/ilustrations/nasa.png",
                  width: 100,
                  height: 100,
                )
              ],
            ),
          ),
          SizedBox(
            height: 70,
          ),
          Row(
            children: [
              SizedBox(
                width: 45,
              ),
              Dates(
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

    );
  }
}