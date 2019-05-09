import 'dart:math';

import 'package:flutter/material.dart';
import 'package:musicpalyer/alubumpic.dart';
import 'package:musicpalyer/files.dart';
//import 'package:musicpalyer/songs.dart';
import 'package:musicpalyer/theme.dart';
void main() {
  runApp(
    MaterialApp(
      title: 'Reading and Writing Files',
      home: FlutterDemo(storage: CounterStorage()),
    ),
  );
}

class MusicPlayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: Icon(
            Icons.arrow_back_ios,
            color: Colors.blueGrey,
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.menu,
                color: Colors.blueGrey,
              ),
            )
          ],
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              //seekbar

              Expanded(
                  child: Center(
                      child: Container(
                          width: 125.0,
                          height: 125.0,
                          child: ClipOval(
                              clipper: CircleClipper(),
                              child: ProfilePic())))),

              //visuvalizer

              Container(
                height: 150.0,
                width: double.infinity,
              ),

              //last part song titles and controls
              Container(
                child: Material(
                  shadowColor: const Color(0x44000000),
                  color: accentcolor,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40.0, bottom: 50.0),
                    child: Column(
                      children: <Widget>[
                        new RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(text: "", children: [
                              TextSpan(
                                  text: "Stay a little longer\n",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13.0,
                                    letterSpacing: 4.0,
                                    height: 1.5,
                                    fontWeight: FontWeight.bold,
                                  )),
                              TextSpan(
                                  text: "Shrada Kapoor",
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.85),
                                    fontSize: 13,
                                    letterSpacing: 3.0,
                                    height: 1.3,
                                  )),
                            ])),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Material
                          (
                            color: accentcolor,
                            child: Row(
                              children: <Widget>[
                                Expanded(child: Container()),
                                new PreviousButton(),

                                Expanded(child: Container()),
                                
                                new PlayPauseButton(),

                                Expanded(child: Container()),
                                
                                new NextButton(),

                                Expanded(child: Container()),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

class NextButton extends StatelessWidget {
  const NextButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
       highlightColor: Colors.transparent,
        splashColor: lightaccentcolor.withOpacity(0.45),
        icon: Icon(
          Icons.skip_next,
          size: 29.0,
        ),
        color: Colors.white,
        onPressed: () {});
  }
}

class PlayPauseButton extends StatelessWidget {
  const PlayPauseButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      child: Icon(
        Icons.play_arrow,
        color: accentcolor,
      ),
      shape: CircleBorder(),
      color: Colors.white,
      splashColor: lightaccentcolor.withOpacity(0.45),
      highlightColor: lightaccentcolor,
      elevation: 16.0,
    );
  }
}

class PreviousButton extends StatelessWidget {
  const PreviousButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: (){},
       
          highlightColor: Colors.transparent,
        splashColor: lightaccentcolor.withOpacity(0.45),
          icon: Icon(
            
            Icons.skip_previous,
            color: Colors.white,
            size: 29.0,
          ),
        
    );
  }
}

class CircleClipper extends CustomClipper<Rect> {
  @override
  getClip(Size size) {
    return new Rect.fromCircle(
      center: Offset(
        size.width / 2,
        size.height / 2,
      ),
      radius: min(size.width, size.height) / 2,
    );
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}
