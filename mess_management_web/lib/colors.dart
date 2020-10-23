import 'package:flutter/material.dart';

const Color white = const Color.fromRGBO(255, 255, 255, 1);

const Color black90 = const Color.fromRGBO(0, 0, 0, 0.9);
const Color black80 = const Color.fromRGBO(0, 0, 0, 0.8);
const Color black60 = const Color.fromRGBO(0, 0, 0, 0.6);
const Color black48 = const Color.fromRGBO(0, 0, 0, 0.48);
const Color black36 = const Color.fromRGBO(0, 0, 0, 0.36);
const Color black04 = const Color.fromRGBO(0, 0, 0, 0.04);

const Color grey = const Color(0xff9e9e9e);

MaterialColor appPrimary = MaterialColor(
  _appPrimaryValue,
  <int, Color>{
    50: Color(0xFF000000),
    100: Color(0xFF000000),
    200: Color(0xFF000000),
    300: Color(0xFF000000),
    400: Color(0xFF000000),
    500: Color(_appPrimaryValue),
    600: Color(0xFF000000),
    700: Color(0xFF000000),
    800: Color(0xFF000000),
    900: Color(0xFF000000),
  },
);

int _appPrimaryValue = appOrange.value;
const Color appBlack = const Color(0xff3d4543);
const Color appOrange = const Color(0xffff7750);
const Color appPurple = const Color(0xff665fff);
const Color appPurple2 = const Color(0xff6b63ef);

const Color appGreen = const Color(0xff66da8c);
const Color appLightOrange = const Color.fromRGBO(255, 119, 80, 0.04);
