import 'dart:math';

import 'package:audioplayers/audio_cache.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:stayfocused/home_page/home.dart';

class Confitti extends StatefulWidget {
  final Widget child;
  final Widget child2;
  final double heigh;
  final double widt;
  final VoidCallback onPress;
  final String route;

  Confitti(
      {Key key,
        @required this.child,
        this.child2,
        this.heigh,
        this.widt,
        this.onPress,
        this.route})
      : super(key: key);

  @override
  _confittiState createState() => _confittiState();
}

class _confittiState extends State<Confitti> {
  ConfettiController _controllerCenter;
  ConfettiController _controllerCenterRight;
  ConfettiController _controllerCenterLeft;
  ConfettiController _controllerTopCenter;
  ConfettiController _controllerBottomCenter;


  @override
  void initState() {
    _controllerCenter =
        ConfettiController(duration: const Duration(seconds: 5));
    _controllerCenterRight =
        ConfettiController(duration: const Duration(seconds: 5));
    _controllerCenterLeft =
        ConfettiController(duration: const Duration(seconds: 5));
    _controllerTopCenter =
        ConfettiController(duration: const Duration(seconds: 5));
    _controllerBottomCenter =
        ConfettiController(duration: const Duration(seconds: 5));
    //_controllerTopCenter.play();
    //_controllerCenterRight.play();
    //_controllerCenterLeft.play();

    _controllerBottomCenter.play();
    _controllerCenter.play();
    //final player =new AudioCache();
    //player.play('audiofiles/tada.wav');
    super.initState();

  }

  @override
  void dispose() {
    _controllerCenter.dispose();
    _controllerCenterRight.dispose();
    _controllerCenterLeft.dispose();
    _controllerTopCenter.dispose();
    _controllerBottomCenter.dispose();
    super.dispose();
  }

  /// A custom Path to paint stars.
  Path drawStar(Size size) {
    // Method to convert degree to radians
    double degToRad(double deg) => deg * (pi / 180.0);

    const numberOfPoints = 5;
    final halfWidth = size.width / 2;
    final externalRadius = halfWidth;
    final internalRadius = halfWidth / 2.5;
    final degreesPerStep = degToRad(360 / numberOfPoints);
    final halfDegreesPerStep = degreesPerStep / 2;
    final path = Path();
    final fullAngle = degToRad(360);
    path.moveTo(size.width, halfWidth);

    for (double step = 0; step < fullAngle; step += degreesPerStep) {
      path.lineTo(halfWidth + externalRadius * cos(step),
          halfWidth + externalRadius * sin(step));
      path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
          halfWidth + internalRadius * sin(step + halfDegreesPerStep));
    }
    path.close();
    return path;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          //CENTER -- Blast
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: _controllerCenter,
              blastDirectionality: BlastDirectionality
                  .explosive, // don't specify a direction, blast randomly
              shouldLoop:
              false, // start again as soon as the animation is finished
              colors: const [
                Colors.green,
                Colors.blue,
                Colors.pink,
                Colors.orange,
                Colors.purple
              ], // manually specify the colors to be used
              createParticlePath: drawStar, // define a custom shape/path.
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: FlatButton(
                child: widget.child2),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ConfettiWidget(
              confettiController: _controllerBottomCenter,
              blastDirection: -pi / 2,
              emissionFrequency: 0.01,
              numberOfParticles: 20,
              maxBlastForce: 100,
              minBlastForce: 80,
              gravity: 0.3,
            ),
          ),
          /*Align(
              alignment: Alignment.bottomRight,
              child: FlatButton(
                onPressed: () {
                  debugPrint(MediaQuery.of(context).size.width.toString());
                  debugPrint(MediaQuery.of(context).size.height.toString());
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyHomePage()),
                  );
                },
                child: Text(
                  "Okay",
                  style: TextStyle(color: Color(0xff2d6a4f), fontSize: 20.0.sp,fontWeight: FontWeight.bold),
                ),
              )
          ),*/
          Align(
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                child: RaisedButton(
                    color: Color(0xff2d6a4f),
                    child: widget.child,
                    elevation: 0,
                    onPressed: widget.onPress ??
                            () {
                          debugPrint("pressed");
                        },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(
                          color: Color(0xff2d6a4f),
                        ))),
              )
          ),
        ],
      ),
    );
  }

  Text _display(String text) {
    return Text(
      text,
      style: TextStyle(color: Colors.black, fontSize: 20.0.sp,fontWeight: FontWeight.normal),
    );
  }
}
