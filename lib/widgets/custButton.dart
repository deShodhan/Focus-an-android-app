import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class custButton extends StatefulWidget {
  final Widget child;
  final double heigh;
  final double widt;
  final VoidCallback onPress;
  final String route;

  custButton(
      {Key key,
      @required this.child,
      this.heigh,
      this.widt,
      this.onPress,
      this.route})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _custButton();
  }
}

class _custButton extends State<custButton> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final wid = MediaQuery.of(context).size.width;
    final hig =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    final shig = MediaQuery.of(context).padding.top;
    return RaisedButton(
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
            )));
  }
}

/*---------------------------custContainer-------------------------------------*/
class custCont extends StatefulWidget {
  final Widget child;
  final double heigh;
  final double widt;
  final Color colors;
  final VoidCallback onPress;

  custCont(
      {Key key,
      @required this.child,
      this.heigh,
      this.widt,
      this.onPress,
      this.colors})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _custCont();
  }
}

class _custCont extends State<custCont> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final wid = MediaQuery.of(context).size.width;
    final hig =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    final shig = MediaQuery.of(context).padding.top;
    return GestureDetector(
      child: Container(
        height: widget.heigh ?? hig * .25,
        width: widget.widt ?? wid * .9,
        child: widget.child,
        decoration: BoxDecoration(
            color: widget.colors ?? Color(0XFFEFF3F6),
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.1),
                  offset: Offset(6, 2),
                  blurRadius: 6.0,
                  spreadRadius: 3.0),
              BoxShadow(
                  color: Color.fromRGBO(255, 255, 255, 0.9),
                  offset: Offset(-6, -2),
                  blurRadius: 6.0,
                  spreadRadius: 3.0)
            ]),
      ),
      onTap: widget.onPress ??
          () {
            debugPrint("on pressed in custom constructor");
          },
    );
  }
}

/*---------------------------custYourThought-------------------------------------*/
class custYT extends StatefulWidget {
  final Widget child;
  final double heigh;
  final double widt;
  final String text1;
  final String text2;
  final VoidCallback onPress;

  custYT({
    Key key,
    @required this.child,
    this.heigh,
    this.widt,
    this.text1,
    this.text2,
    this.onPress,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _custYT();
  }
}

class _custYT extends State<custYT> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final wid = MediaQuery.of(context).size.width;
    final hig =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    final shig = MediaQuery.of(context).padding.top;
    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.all(wid * .05),
        child: Container(
            height: widget.heigh ?? wid * .16,
            width: widget.widt ?? wid,
            decoration: BoxDecoration(
                color: Color(0xFFe6ebf2),
                borderRadius: BorderRadius.all(Radius.circular(10)), //20.0
                boxShadow: [
                  BoxShadow(
                      blurRadius: 5.0, //5.0
                      offset: Offset(-3, -3),
                      color: Colors.white.withOpacity(.7)),
                  BoxShadow(
                      blurRadius: 5.0,
                      offset: Offset(3, 3),
                      color: Colors.black.withOpacity(.15))
                ]),
            child: Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.all(wid * .05),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Icon(
                          Icons.colorize,
                          color: Color(0xff2d6a4f),
                          size: wid * .08,
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.all(wid * .05),
                    child: FittedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(widget.text1,
                              style: TextStyle(
                                  fontFamily: "nunito",
                                  color: Colors.black.withOpacity(.5),
                                  fontSize: 15.0)),
                          Text(widget.text2,
                              style: TextStyle(
                                  fontFamily: "nunito",
                                  color: Colors.black.withOpacity(.5),
                                  fontSize: 15.0))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
      onTap: widget.onPress ??
          () {
            debugPrint("second");
          },
    );
  }
}