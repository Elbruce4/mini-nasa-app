import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DetailAsteroids extends StatefulWidget {
  var name;
  
  var id;

  DetailAsteroids(
    {
      required this.name,
      required this.id}
  );

  @override
  State<DetailAsteroids> createState() => _DetailAsteroidsState();
}

class _DetailAsteroidsState extends State<DetailAsteroids> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border.all(color: const Color(0xff252057)),
        borderRadius: BorderRadius.circular(30)
      ),
      margin: EdgeInsets.all(10),
      width: 50,
      height: 50,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            widget.name,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16
            ),
          ),
          Text(
            widget.id,
            style: TextStyle(
              color: Colors.white,
              fontSize: 10
            ),
          ),
        ],
      ),
    );
  }
}