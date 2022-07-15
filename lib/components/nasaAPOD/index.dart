import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:nasaapp/api/APOD/index.dart';

import '../../downlader/dowlandImage.dart';
import '../../toast/index.dart';
import '../photoWidget.dart/index.dart';

class NasaAPOD extends StatefulWidget {
  const NasaAPOD({Key? key}) : super(key: key);

  @override
  State<NasaAPOD> createState() => _NasaAPODState();
}

class _NasaAPODState extends State<NasaAPOD> {
  var data;
  bool show = false;
  bool loading = false;

  void getData () async {
    setState(() {
      loading = true;
    });
    var info = await getPictireOfTheDay(context);
    if (info is DioError) {
      showToast("Something went wrong", "error", 5, context);
    } else {
      setState(() {
        data = info;
        loading = false;
      });
    }
  }
  @override
  void initState() {
    print("esta en la pic del day");
    getData();
    super.initState();
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
      child: Column(
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
          Container(
            height: 500,
            child: LoadingOverlay(
              isLoading: loading,
              color: Colors.black,
                      opacity: 0.8,
                      progressIndicator: CircularProgressIndicator(
                        color: Color.fromARGB(255, 24, 40, 187),
                        strokeWidth: 6,
                      ),
              child: PhotoWidget(data ?? {})
            ),
          ),
        ],
      ),
    );
  }
}