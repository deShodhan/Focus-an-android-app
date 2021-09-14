import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stayfocused/config/images.dart';
import 'package:stayfocused/home_page/home.dart';
import 'package:sizer/sizer.dart';


class suggetions extends StatefulWidget {
  @override
  _suggetionsState createState() => _suggetionsState();
}

class _suggetionsState extends State<suggetions> {
  TextEditingController mycontroller = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomPadding: false,
      body:ListView(
        children: [
          Container(
            height: 100.0.h,
            width: 100.0.w,
            child: Center(
                child: Container(
                  height: 50.0.h,
                  width: 80.0.w,
                  child: ListView(
                    children: [
                      Container(
                        height: 20.0.h,
                        width: 80.0.w,
                        child: Row(
                          children: [
                            SizedBox(
                              height: 20.0.h,
                              width: 25.0.w,
                              child: Center(
                                child: Container(
                                  height: 20.0.w,
                                  width: 20.0.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                    border: Border.all(color: Colors.grey[200], width: 1.0),
                                    image: DecorationImage(
                                      image: AssetImage('${Images.tree_in_home}'),
                                      fit: BoxFit.cover,
                                      colorFilter: ColorFilter.mode(
                                          Colors.black.withOpacity(0.9), BlendMode.dstATop),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20.0.h,
                              width: 55.0.w,
                              child: Container(
                                height: 20.0.h,
                                width: 70.0.w,
                                child: Text('Hy buddy, This is Rosie. What does your friends call you?:)\n',
                                    textScaleFactor: 1,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17.0.sp,
                                        fontWeight: FontWeight.normal)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 10.0.h,
                        width: 80.0.w,
                        child: TextField(
                          minLines: 1,
                          maxLines: 5,
                          style: TextStyle(
                              fontSize: 15.0.sp,
                              color: Colors.black,fontWeight: FontWeight.normal
                          ),
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0XFFEFF3F6))),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0XFFEFF3F6))),
                            hintText: "Note it here",
                            hintStyle:
                            TextStyle(color: Colors.grey, fontSize: 17.0.sp,fontWeight: FontWeight.normal),
                          ),
                          onChanged: (String userIn) {
                            setState(() {});
                          },
                          controller: mycontroller,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: FlatButton(
                          onPressed: (){
                            if(mycontroller.text.isNotEmpty){
                              _savePrefs();
                            }else{
                              final snackBar = SnackBar(content: Text('Enter your name :)'));
                              _scaffoldKey.currentState.showSnackBar(snackBar);
                            }
                          },
                          child: Text('Next', textScaleFactor: 1,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 19.0.sp,
                                  fontWeight: FontWeight.bold)),),
                      ),
                    ],
                  ),
                )
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _savePrefs() async {
    final prefs= await SharedPreferences.getInstance();
    await prefs.setString('getname', mycontroller.text).whenComplete((){
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => welcome()),
        //You(index: index)
      );
    });
  }
}

class welcome extends StatefulWidget {
  @override
  _welcomeState createState() => _welcomeState();
}

class _welcomeState extends State<welcome> {
  var theData;
  bool yes=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkSuggetions().whenComplete(() {
      setState(() {
        yes=true;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
      body:yes?Container(
        height: 100.0.h,
        width: 100.0.w,
        child: Center(
            child: Container(
              height: 85.0.h,
              width: 80.0.w,
              child: Column(
                children: [
                  Container(
                    height: 70.0.h,
                    width: 80.0.w,
                    child: Row(
                      children: [
                        Column(
                          children: [
                            SizedBox(height: 50.0.h,),
                            SizedBox(
                              height: 20.0.h,
                              width: 25.0.w,
                              child: Center(
                                child: Container(
                                  height: 20.0.w,
                                  width: 20.0.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                    border: Border.all(color: Colors.grey[200], width: 1.0),
                                    image: DecorationImage(
                                      image: AssetImage('${Images.tree_in_home}'),
                                      fit: BoxFit.cover,
                                      colorFilter: ColorFilter.mode(
                                          Colors.black.withOpacity(0.9), BlendMode.dstATop),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 70.0.h,
                          width: 55.0.w,
                          child: Container(
                            height: 70.0.h,
                            width: 70.0.w,
                            child: RichText(
                              textScaleFactor: 1,
                              text: new TextSpan(
                                // Note: Styles for TextSpans must be explicitly defined.
                                // Child text spans will inherit styles from parent
                                style: new TextStyle(
                                  fontSize: 17.0,
                                  color: Colors.black,
                                ),
                                children: <TextSpan>[
                                  new TextSpan(
                                      text: "Hy $theData, I'm happy to know that you decided to manage your time effectively! "
                                          "I hope you find this app helpful :)\n\n",
                                      style:
                                      new TextStyle(fontWeight: FontWeight.normal)),
                                  new TextSpan(
                                      text: ' How to use? \n',
                                      style: new TextStyle(fontWeight: FontWeight.bold)),
                                  new TextSpan(
                                      text: "Go to Nursery, select a tree and get back to your work. Keep off your phone and your tree grows!"
                                          "\n\nNote: If you close the app or try to run it in the background, your tree does'nt grow. "
                                          "\nSo put your phone aside and be productive!",
                                      style:
                                      new TextStyle(fontWeight: FontWeight.normal)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: FlatButton(
                      onPressed: (){
                        _savePrefs();
                      },
                      child: Text('Okay', textScaleFactor: 1,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 19.0.sp,
                              fontWeight: FontWeight.bold)),),
                  ),
                ],
              ),
            )
        ),
      ):
          Container(
            height: 100.0.h,
            width: 100.0.w,
            child: Center(
              child: Container(
                height: 10.0.w,
                width: 10.0.w,
                child: CircularProgressIndicator(),
              ),
            ),
          )
    );
  }
  Future<void> _savePrefs() async {
    final prefs= await SharedPreferences.getInstance();
    await prefs.setInt('checked', 5).whenComplete((){
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MyHomePage()),
        //You(index: index)
      );
    });
  }

  Future<void> checkSuggetions() async {
    final sharedPreferences= await SharedPreferences.getInstance();
    theData =sharedPreferences.getString('getname');
    //debugPrint("data is------------------------------------------------------------"+theData.toString());
  }
}
