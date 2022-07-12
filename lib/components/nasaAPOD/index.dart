import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nasaapp/api/APOD/index.dart';

class NasaAPOD extends StatefulWidget {
  const NasaAPOD({Key? key}) : super(key: key);

  @override
  State<NasaAPOD> createState() => _NasaAPODState();
}

class _NasaAPODState extends State<NasaAPOD> {
  var data;
  bool show = false;

  void getData () async {
    var info = await getPictireOfTheDay(context);
    setState(() {
      data = info;
    });
    print("data: $data");
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
          if(show) (
            (
            Column(
              children: [
                Positioned(
                  left: 100.00,
                  child: GestureDetector(
                    child: Icon(Icons.close, color: Color.fromARGB(255, 50, 24, 199)),
                    onTap: () {
                      setState(() {
                        show = !show;
                      });
                    },
                  ),
                ),
                Image.network(data["url"]),
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
                )
              ],
            )
            )
          ),
        ],
      ),
    );
  }
}