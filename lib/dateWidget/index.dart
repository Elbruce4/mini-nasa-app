import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:numberpicker/numberpicker.dart';

class Dates extends StatefulWidget {
  var val;
  
  var min;
  
  var max;
  
  var onChange;

  Dates({
    this.val,
    this.min,
    this.max,
    this.onChange
  }); 

  @override
  State<Dates> createState() => _DatesState();
}

class _DatesState extends State<Dates> {
  @override
  Widget build(BuildContext context) {
    return Material(
        type: MaterialType.transparency,
        child: NumberPicker(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: const Color(0xff0F69B3), width: 2)),
          value: widget.val,
          minValue: widget.min,
          maxValue: widget.max,
          textStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: "Monserrat",
          ),
          selectedTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: "Monserrat",
          ),
          onChanged: widget.onChange),
      );
  }
}