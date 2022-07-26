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
          image: DecorationImage(
            image: (int.parse(widget.id) % 2) == 0 ? AssetImage("assets/ilustrations/asteroid.png") : AssetImage("assets/ilustrations/meteor.png"),
            fit: BoxFit.cover
          ),
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
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 16
              ),
            ),
            Text(
              "ID: ${widget.id}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 12
              ),
            ),
          ],
        ),
      ),
    );
  }
}