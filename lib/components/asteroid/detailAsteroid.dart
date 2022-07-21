import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DetailAsteroids extends StatefulWidget {
  var name;
  var data;
  var id;

  DetailAsteroids(
    {
      required this.name,
      required this.id,
      required this.data
    }
  );

  @override
  State<DetailAsteroids> createState() => _DetailAsteroidsState();
}

class _DetailAsteroidsState extends State<DetailAsteroids> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context, 
          "/EachAsteroidDetail",
          arguments: widget.data);
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xff252057),
          border: Border.all(color: Color.fromARGB(255, 255, 255, 255)),
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
                fontSize: 24
              ),
            ),
            Text(
              "ID: ${widget.id}",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16
              ),
            ),
          ],
        ),
      ),
    );
  }
}