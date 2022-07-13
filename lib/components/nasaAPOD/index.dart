import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:nasaapp/api/APOD/index.dart';

import '../../downlader/dowlandImage.dart';

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
    setState(() {
      data = info;
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
    
    return Container(
      child: Column(
        children: [
          if(!show)(
            ElevatedButton(onPressed: () { setState(() {
              show = !show;
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
              child: (
                (
                Column(
                  children: [
                    GestureDetector(
                      child: Icon(Icons.close, color: Color.fromARGB(255, 50, 24, 199)),
                      onTap: () {
                        setState(() {
                          show = !show;
                        });
                      },
                    ),
                    Image.network(
                      
                      data["url"],
                      loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) {
                            return child;
                          }
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          );
                      },
                      width: 400,
                      height: 200,
                      ),
                    Text(
                      data["title"],
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black
                      ),
                    ),
                    Text(
                      data["date"],
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black
                      ),
                    ),
                    RaisedButton(
                      onPressed: () {
                        image_Downlader(data["url"]);
                      },
                      child: Text("Download Image"),
                    )
                  ],
                )
                )
              ),
            ),
          ),
        ],
      ),
    );
  }
}