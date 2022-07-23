import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:nasaapp/reUsed/headerPop.dart';

import '../../api/PeopleInSpace/index.dart';
import '../../reUsed/WidgetHumanInSpace.dart';
import '../../toast/index.dart';

class PeolpleInSpace extends StatefulWidget {
  const PeolpleInSpace({Key? key}) : super(key: key);

  @override
  State<PeolpleInSpace> createState() => _PeolpleInSpaceState();
}

class _PeolpleInSpaceState extends State<PeolpleInSpace> {

  var data;
  bool loading = false;

  getData () async {
    setState(() {
      loading = true;
    });
    var info = await getPeolpleInSpace(context);
    if(info is DioError) {
      showToast("Something went wrong", "error", 5, context);
    } else {
      setState(() {
        print(info[info.length - 1]);
        data = jsonDecode(info.substring(2 , info.length - 1));
        print(data.runtimeType);
        print("numero: ${data["number"].toString()}");
      });
    }
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {

    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: loading,
      child: Material(
        type: MaterialType.transparency,
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
              HeaderPop(),
              if(data != null) Container(
                margin: EdgeInsets.only(
                  left: 24
                ),
                child: (
                Row(
                  children: [
                    Text(
                      "In this moment are: ${data["number"].toString()}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16
                      ),
                    )
                  ],
                )),
              ),
              SizedBox(
                height: 50,
              ),
              if(data != null) (
              Container(           
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomRight,
                    stops: [0.4, 1],
                    colors: [Color.fromARGB(255, 83, 79, 143), Color.fromARGB(255, 60, 49, 179)],
                  ),
                ),
                height: 300,     
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ...data["people"].map((obj) => 
                      HumanInSpaceWidget(name : obj["name"])
                    )
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}