import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:nasaapp/api/APOD/index.dart';

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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /* GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                  width: 50,
                  margin: EdgeInsets.only(
                      right: 40),
                  child: SvgPicture.asset(
                    'assets/icons/BackButton.svg',
                  )),
                  ios_share_outlined
            ), */
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
                    Icons.arrow_circle_down,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    print("entra");
                    image_Downlader(args["url"] , context);
                  },
                ),
            )
          ],
        ),
      ),
    );
  }
}