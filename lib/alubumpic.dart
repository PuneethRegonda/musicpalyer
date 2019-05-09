import 'package:flutter/material.dart';

class ProfilePic extends StatelessWidget {
  final double circleRadius ;
  final double circleBorderWidth;
  const ProfilePic({
   this.circleRadius,
    this.circleBorderWidth,
    Key key}):super(key: key);
  final double defalutcircleRadius = 300.0;
  final double defalutcircleBorderWidth = 8.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        Container(
          width: circleRadius==null?defalutcircleRadius:circleRadius,
          height: circleRadius==null?defalutcircleRadius:circleRadius,
          decoration: ShapeDecoration(shape: CircleBorder(), color: Colors.white),
          child: Padding(
            padding: EdgeInsets.all(circleBorderWidth==null?defalutcircleBorderWidth:circleRadius,
            ),
            child: DecoratedBox(
              decoration: ShapeDecoration(
                  color: Colors.grey[350],
                  shape: CircleBorder(),
                  image: DecorationImage(
                      fit: BoxFit.fitHeight,
                      image: AssetImage("assets/ItsMe.jpg"))),
            ),
          ),
        ),

      ],
    );
  }
}



