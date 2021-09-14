import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SizeConf{

  static double sWidth(BuildContext context){
    double width=MediaQuery.of(context).size.width;
    double scale=MediaQuery.of(context).textScaleFactor;
    return width*scale;
  }
  static double sHeight(BuildContext context){
    double height=MediaQuery.of(context).size.height;
    double scale=MediaQuery.of(context).textScaleFactor;
    return height*scale;
  }
}