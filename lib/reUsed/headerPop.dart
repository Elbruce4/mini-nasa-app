import 'package:flutter/cupertino.dart';
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
    return Container(
      margin: EdgeInsets.only(
        left: 25
      ),
      child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                        width: 50,
                        margin: EdgeInsets.only(
                            right: 20),
                        child: SvgPicture.asset(
                          'assets/icons/BackButton.svg',
                        )),
                  ),
                  Image.asset(
                    "assets/ilustrations/nasa.png",
                    width: 100,
                    height: 100,
                  )
                ],
              ),
    );
  }
}