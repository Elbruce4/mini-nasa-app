import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
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
    widgetInit();
    super.initState();
  }

/*   @override
  void didChangeDependencies() {
    setState(() {
      args = ModalRoute.of(context)!.settings.arguments;
    });
    super.didChangeDependencies();
  } */

  
  @override
  
  Widget build(BuildContext context) {


    return Container(
      decoration: BoxDecoration(
        image: args != null ? DecorationImage(
          image: NetworkImage(args["url"]),
          fit: BoxFit.cover
        )
        :
        null
      ),
      height: 800,
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                  width: 20,
                  margin: EdgeInsets.only(
                      right: 20),
                  child: SvgPicture.asset(
                    'assets/icons/BackButton.svg',
                  )),
            ),
            RaisedButton(
              onPressed: () {
                image_Downlader(args["url"] , context);
              },
              child: Text("Download Image"),
            )
          ],
        ),
      ),
    );
  }
}