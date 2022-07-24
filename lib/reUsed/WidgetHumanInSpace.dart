import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:url_launcher/url_launcher.dart';

class HumanInSpaceWidget extends StatefulWidget {
  var name;

  HumanInSpaceWidget(
    {required this.name}
  );

  @override
  State<HumanInSpaceWidget> createState() => _HumanInSpaceWidgetState();
}

class _HumanInSpaceWidgetState extends State<HumanInSpaceWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      child: Column(
        children:[
          Text(widget.name)
        ]
      ),
    );
  }
}