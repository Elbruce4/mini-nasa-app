import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
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

  void changeShow () {
    setState(() {
      show = !show;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    return Container(
      child: Column(
        children: [
          if(!show)(
            ElevatedButton(onPressed: () { setState(() {
              show = !show;
              getData();
            });}, child: Text("Show image of the day"))
          ),
          if(show) Container(
            height: 500,
            child: LoadingOverlay(
              isLoading: loading,
              color: Colors.black,
                      opacity: 0.8,
                      progressIndicator: CircularProgressIndicator(
                        color: Color.fromARGB(255, 24, 40, 187),
                        strokeWidth: 6,
                      ),
              child: PhotoWidget( changeShow , data)
            ),
          ),
        ],
      ),
    );
  }
}