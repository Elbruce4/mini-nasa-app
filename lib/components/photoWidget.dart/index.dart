import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../downlader/dowlandImage.dart';

class PhotoWidget extends StatefulWidget {
  Function onShow;
  Map onData;

  PhotoWidget(
    this.onShow,
    this.onData
  );

  @override
  State<PhotoWidget> createState() => _PhotoWidgetState();
}

class _PhotoWidgetState extends State<PhotoWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: Column(
        children: [
          GestureDetector(
            child: Icon(Icons.close, color: Color.fromARGB(255, 50, 24, 199)),
            onTap: () {
                widget.onShow();
            },
          ),
          Image.network(
            widget.onData["url"],
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
            widget.onData["title"],
            style: TextStyle(
              fontSize: 20,
              color: Colors.white
            ),
          ),
          Text(
            widget.onData["date"],
            style: TextStyle(
              fontSize: 15,
              color: Colors.white
            ),
          ),
          RaisedButton(
            onPressed: () {
              image_Downlader(widget.onData["url"] , context);
            },
            child: Text("Download Image"),
          )
        ],
      ),
    );
  }
}