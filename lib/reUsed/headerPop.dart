import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';

class HeaderPop extends StatefulWidget {
  const HeaderPop({Key? key}) : super(key: key);

  @override
  State<HeaderPop> createState() => _HeaderPopState();
}

class _HeaderPopState extends State<HeaderPop> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        
        color: Color(0xff0C0A26),
        margin: EdgeInsets.only(
          left: 0
        ),
        child: Row(
          children: [
            IconButton(
            color: Colors.black,
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
            Image.asset(
              "assets/ilustrations/nasa.png",
              width: 100,
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}