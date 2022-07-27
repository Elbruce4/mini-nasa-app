import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:nasaapp/api/APOD/index.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:share_plus/share_plus.dart';

import '../../downlader/dowlandImage.dart';
import '../../storage/index.dart';
import '../../toast/index.dart';

class PhotoWidget extends StatefulWidget {


  @override
  State<PhotoWidget> createState() => _PhotoWidgetState();
}

class _PhotoWidgetState extends State<PhotoWidget> {

  var args;
  var key;
  var _progress = 0;
  bool isDownloading = false;
  bool loading = false;


  widgetInit () async {
    setState(() {
      loading = true;
    });

    key = await readData("string" , "pic");
    print("key $key");

    if(key == "selectDate") {
      // ignore: use_build_context_synchronously
      var info = ModalRoute.of(context)!.settings.arguments;
      setState(() {
         args = info;
      });
    } else if( key == "picOfDay") {
      var info = await getPictireOfTheDay(context);
      print("info: $info");
      if (info is DioError) {
        showToast("Something went wrong", "error", 5, context);
      } else {
        setState(() {
          args = info;
      });
    }

    }
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    widgetInit();
    ImageDownloader.callback(onProgressUpdate: (String? imageId, int progress) {
      setState(() {
        isDownloading = true;
        _progress = progress;
      });
    });
    /* SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]); */
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    /* SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]); */
  }

  Widget showOptions () {
    return Card(
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          items: [
            DropdownMenuItem(
              value: "Download",
              child: Center(
                child: Text(
                  "Download",
                  style: TextStyle(fontSize: 32),
                ),
              ),
            ),
            DropdownMenuItem(
              value: "Share",
              child: Center(
                child: Text(
                  "Share",
                  style: TextStyle(fontSize: 32),
                ),
              ),
            )
          ],
          onChanged: (_) {},
        ),
      ),
    );
  }

  
  @override
  
  Widget build(BuildContext context) {


    return Container(
      decoration: BoxDecoration(
        image: args != null ? DecorationImage(
          image: NetworkImage(args["url"]),
          fit: BoxFit.fitWidth
        )
        :
        null
      ),
      height: 700,
      width: 400,
      margin: EdgeInsets.only(
        top: 30
      ),
      child: LoadingOverlay(
        color: Colors.black,
        opacity: 0.8,
        progressIndicator: CircularProgressIndicator(
          color: Color.fromARGB(255, 24, 40, 187),
          strokeWidth: 6,
        ),
        isLoading: loading,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:[
            Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Card(
                color: Colors.black,
                child: IconButton(
                    color: Colors.black,
                    icon: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
              ),
              Card(
                color: Colors.black,
                child: IconButton(
                    color: Colors.black,
                    icon: Icon(
                      Icons.ios_share_outlined,
                      color: Colors.white,
                    ),
                    onPressed: () async {
                      await Share.share(args["url"]);
                    },
                  ),
              ),
              Card(
                color: Colors.black,
                child: IconButton(
                    color: Colors.black,
                    icon: Icon(
                      Icons.arrow_circle_down,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      image_Downlader(args["url"] , context);
                    },
                  ),
              )
            ],
          ),
          if(_progress < 100) 
          Column(
            children: [
              Visibility(
                visible: isDownloading,
                child: Material(
                  type: MaterialType.transparency,
                  child: Text(
                    "Downloading, This could take a few seconds",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 13
                  )),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Visibility(
                visible: isDownloading,
                child: CircularPercentIndicator(
                  progressColor: Colors.blue,
                  radius: 40,
                  percent: (_progress / 100),
                  center: Text(
                    "$_progress",
                    style: TextStyle(
                    color: Colors.white
                  ))
                ),
            ),
          ]),
          ]
        ),
      ),
    );
  }
}