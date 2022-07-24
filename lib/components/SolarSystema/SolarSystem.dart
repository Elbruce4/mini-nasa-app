import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nasaapp/reUsed/headerPop.dart';

class SolarSystem extends StatefulWidget {
  const SolarSystem({Key? key}) : super(key: key);

  @override
  State<SolarSystem> createState() => _SolarSystemState();
}

class _SolarSystemState extends State<SolarSystem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          HeaderPop()
        ],
      ),
    );
  }
}