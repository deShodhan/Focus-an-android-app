import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:stayfocused/config/images.dart';
import 'package:stayfocused/home_page/home.dart';
import 'package:stayfocused/pages/forest.dart';

class about extends StatefulWidget {
  @override
  _aboutState createState() => _aboutState();
}

class _aboutState extends State<about> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: _body(context),
      bottomNavigationBar: _bottomNavigationBar(context),
    );
  }

  Widget _appBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      title: Text(
        "About",
        textScaleFactor: 1,
        style: TextStyle(
          fontSize: 20.0.sp,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _body(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.0.w),
      child: Container(
        height: 100.0.h,
        width: 100.0.w,
        child: ListView(
          children: [
            RichText(
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
                      text:
                          "At Focus app, we believe in transparency and honesty. "
                          "Our terms of service and privacy policy are available below. "
                          "We hope you find this clear and transparent :)\n\n",
                      style: new TextStyle(fontWeight: FontWeight.normal)),
                  new TextSpan(
                      text: 'Privacy policy \n',
                      style: new TextStyle(fontWeight: FontWeight.bold)),
                  new TextSpan(
                      text: "What information do we collect?",
                      style: new TextStyle(fontWeight: FontWeight.normal)),
                  new TextSpan(
                      text: 'Personal. ',
                      style: new TextStyle(fontWeight: FontWeight.bold)),
                  new TextSpan(
                      text:
                          "Focus app do not ask you to signup. Therefore, we do not store or have access to your personal data. ",
                      style: new TextStyle(fontWeight: FontWeight.normal)),
                  new TextSpan(
                      text: 'User generated. ',
                      style: new TextStyle(fontWeight: FontWeight.bold)),
                  new TextSpan(
                      text:
                          "You may have to share some data while using some features like, count down timer, myForest"
                          " etc. This data is stored on your Android device therefore, "
                          "we have no access to this data either.\n\n",
                      style: new TextStyle(fontWeight: FontWeight.normal)),
                  new TextSpan(
                      text: 'Terms of service\n',
                      style: new TextStyle(fontWeight: FontWeight.bold)),
                  new TextSpan(
                      text:
                          "The end user license agreement constitutes an agreement between you and the Focus team (referred to as the Owner) "
                          "with regard to the Focus app (Android ,IOS and Web application) for the mobile phone (referred to as software). "
                          "By installing the application, you are agreeing to be bounded by the terms of this license agreement.\n",
                      style: new TextStyle(fontWeight: FontWeight.normal)),
                  new TextSpan(
                      text: 'Harm to Focus app.',
                      style: new TextStyle(fontWeight: FontWeight.bold)),
                  new TextSpan(
                      text: "You must not (or assist others to)"
                          " access, use, modify, distribute, transfer, or exploit our services in unauthorized manners. "
                          "For example you must not ",
                      style: new TextStyle(fontWeight: FontWeight.normal)),
                  new TextSpan(
                      text:
                          "\n(a) get or try to get unauthorized access to our systems or services.\n"
                          "(b) damage or try to damage the reputation, integrity or performance of our services.\n"
                          "(c) copy or modify the app, any part of the app or our trademarks in any way.\n"
                          "(d) collect information about our users in any unauthorized manner or \n"
                          "(e) sell, rent, or charge for our Services.\n"
                          "(f) extract the source code of the app and also you must not translate or try to translate the app into other languages or make derivative versions. The app itself and all "
                          "the trade marks, copyright, database rights and other intellectual property rights related to it, still belongs to focus app.\n",
                      style: new TextStyle(fontWeight: FontWeight.normal)),
                  new TextSpan(
                      text: 'Software. ',
                      style: new TextStyle(fontWeight: FontWeight.bold)),
                  new TextSpan(
                      text:
                          "In order to enable new features and enhanced functionality, you consent to downloading and "
                          "installing updates to our Services.\n",
                      style: new TextStyle(fontWeight: FontWeight.normal)),
                  new TextSpan(
                      text: 'Fees and Taxes. ',
                      style: new TextStyle(fontWeight: FontWeight.bold)),
                  new TextSpan(
                      text:
                          "You are responsible for data and mobile carrier fees and taxes "
                          "associated with the devices on which you use our Services.",
                      style: new TextStyle(fontWeight: FontWeight.normal)),
                ],
              ),
            ),
            SizedBox(
              height: 3.0.h,
            ),
          ],
        ),
      ),
    );
  }

  Widget _bottomNavigationBar(BuildContext context) {
    return BottomAppBar(
      child: Container(
        height: 10.0.h,
        width: 100.0.w,
        child: Row(
          children: [
            SizedBox(
              height: 10.0.h,
              width: 5.0.w,
            ),
            SizedBox(
              height: 10.0.h,
              width: 25.0.w,
              child: Center(
                child: GestureDetector(
                  child: Container(
                    height: 15.0.w,
                    width: 15.0.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey[200], width: 1.0),
                      image: DecorationImage(
                        image: AssetImage('${Images.home}'),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.9), BlendMode.dstATop),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyHomePage()),
                      //You(index: index)
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 10.0.h,
              width: 7.5.w,
            ),
            SizedBox(
              height: 10.0.h,
              width: 25.0.w,
              child: Center(
                child: GestureDetector(
                  child: Container(
                    height: 15.0.w,
                    width: 15.0.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(color: Colors.grey[200], width: 1.0),
                      image: DecorationImage(
                        image: AssetImage('${Images.myForest}'),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.9), BlendMode.dstATop),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => myForest()),
                      //You(index: index)
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 10.0.h,
              width: 7.5.w,
            ),
            SizedBox(
              height: 10.0.h,
              width: 25.0.w,
              child: Center(
                child: GestureDetector(
                  child: Container(
                    height: 15.0.w,
                    width: 15.0.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(color: Colors.black, width: 1.0),
                      image: DecorationImage(
                        image: AssetImage('${Images.info}'),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.9), BlendMode.dstATop),
                      ),
                    ),
                  ),
                  onTap: () {},
                ),
              ),
            ),
            SizedBox(
              height: 10.0.h,
              width: 5.0.w,
            ),
          ],
        ),
      ),
    );
  }
}
