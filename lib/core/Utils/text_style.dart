

import 'dart:ui';

import 'package:bookia_app/core/Utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

TextStyle? getHeadLineTextStyle ({double fontSize = 27,fontWeight=FontWeight.normal,
color=appColors.black}) {

return TextStyle(
fontSize: fontSize, 
fontWeight: FontWeight.normal,
color:color,



);



}



TextStyle getTitleTextStyle ({double fontSize = 24 , fontweight = FontWeight.bold , 
color=appColors.black}) {

return TextStyle(

fontSize: fontSize,
fontWeight: FontWeight.bold,

color: color,

);


}


TextStyle getBodyTextStyle ({double fontSize = 18 , fontWeight =  FontWeight.bold ,
color=appColors.whiteColor}){

return TextStyle(
fontSize: fontSize,
fontWeight: FontWeight.bold ,
color: color

);



}


TextStyle getSmallTextStyle ({double fontSize = 14 , fontWeight = FontWeight.normal,
color=appColors.black}){

return TextStyle(
fontSize: fontSize,
color: color,
fontWeight: FontWeight.normal

);



}
