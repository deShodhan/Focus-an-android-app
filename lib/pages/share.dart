import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:sizer/sizer.dart';
import 'package:stayfocused/config/images.dart';
import 'package:stayfocused/widgets/custButton.dart';

class shareApp extends StatefulWidget {
  @override
  _shareAppState createState() => _shareAppState();
}

class _shareAppState extends State<shareApp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0.h,
      width: 100.0.w,
      color: Colors.white,
      child: Center(
        child: Container(
          height: 60.0.h,
          width: 80.0.w,
          color: Colors.white,
          child: Column(
            children: [
              //SizedBox(height: 20.0.h,),
              Container(
                height: 55.0.w,
                width: 55.0.w,
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                      image: AssetImage('${Images.icon_white}'),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.9), BlendMode.dstATop),
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(7.0),
                    )),
              ),
              RichText(
                textScaleFactor: 1,
                text: new TextSpan(
                  style: new TextStyle(
                    fontSize: 17.0,
                    color: Colors.black,
                  ),
                  children: <TextSpan>[
                    new TextSpan(
                        text: "Share the gift of",
                        style:
                        new TextStyle(fontWeight: FontWeight.normal)),
                    new TextSpan(
                        text: ' Focus \n',
                        style: new TextStyle(fontWeight: FontWeight.bold)),
                    new TextSpan(
                        text: "with your loved ones :)",
                        style:
                        new TextStyle(fontWeight: FontWeight.normal)),
                  ],
                ),
              ),
              SizedBox(height: 5.0.h,),
              Container(
                height: 10.0.h,
                width: 80.0.w,
                child: Center(
                  child: custButton(
                    child: Text(
                      "Share",
                      textScaleFactor: 1,
                      style: TextStyle(
                        fontSize: 18.0.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    onPress: (){
                      Share.share(
                          "Hy Buddy, This app helps me to stay focused and concentrated while studying. "
                              "I think you should also give it a try. Hope you like it! "
                              "https://play.google.com/store/apps/details?id=com.psych.stayfocused");
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
