import 'package:flutter/material.dart';


//Headline
TextStyle getHeadLineTextStyal(context,
    {double fontsize = 24,
    FontWeight fontWeight = FontWeight.bold,
    Color? Color}) {
  return TextStyle(
    fontFamily: 'poppins',
    fontSize: 24,
    fontWeight: fontWeight,
    color: Color ?? Theme.of(context).colorScheme.onSurface,
  );
}

//title
TextStyle getTitleTextStyal(context, 
    {double fontsize = 18,
    FontWeight fontWeight = FontWeight.bold,
     Color? Color  }) {
  return TextStyle(
    fontFamily: 'poppins',
    fontSize: 20,
    fontWeight: fontWeight,
    color: Color ?? Theme.of(context).colorScheme.onSurface,
  );
}

//Body Text
TextStyle getBodyTextStyal(context, 
    {double fontsize = 18,
    FontWeight fontWeight = FontWeight.normal,
    Color? color}) {
  return TextStyle(
    fontFamily: 'poppins',
    fontSize: 16,
    fontWeight: fontWeight,
    color: color ?? Theme.of(context).colorScheme.onSurface,
  );
}

//Smolle Text
TextStyle getSmallTextStyal(context,
    {double fontsize = 16,
    FontWeight fontWeight = FontWeight.bold,
    Color? color}) {
  return TextStyle(
    fontFamily: 'poppins',
    fontSize: 12,
    fontWeight: fontWeight,
   color: color ?? Theme.of(context).colorScheme.onSurface,
  );
}
