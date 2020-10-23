import 'package:flutter/material.dart';

import 'colors.dart';

double scale = 1;

final fs20 = 20 * scale;
final fs18 = 18 * scale;
final fs16 = 16 * scale;
final fs14 = 14 * scale;
final fs13 = 13 * scale;
final fs12 = 12 * scale;
final fs11 = 11 * scale;
final fs10 = 10 * scale;

final appBlack_16_600 =
    TextStyle(fontSize: fs16, color: appBlack, fontWeight: FontWeight.w600);
final appBlack_14 = TextStyle(fontSize: fs14, color: appBlack);
final appBlack_12_600 =
    TextStyle(fontSize: fs12, color: appBlack, fontWeight: FontWeight.w600);

final b90_20_600 =
    TextStyle(fontSize: fs20, color: black90, fontWeight: FontWeight.w600);
final b90_14_600 =
    TextStyle(fontSize: fs14, color: black90, fontWeight: FontWeight.w600);
final b90_14 = TextStyle(fontSize: fs14, color: black90);
final b90_12 = TextStyle(fontSize: fs12, color: black90);

final b90_12_600 =
    TextStyle(fontSize: fs12, color: black90, fontWeight: FontWeight.w600);

final b80_18 = TextStyle(fontSize: fs18, color: black80);
final b80_14 = TextStyle(fontSize: fs14, color: black80);
final b80_14_600 =
    TextStyle(fontSize: fs14, color: black80, fontWeight: FontWeight.w600);
final b80_12 = TextStyle(fontSize: fs12, color: black80);

final b60_14_600 =
    TextStyle(fontSize: fs14, color: black60, fontWeight: FontWeight.w600);
final b60_14 = TextStyle(fontSize: fs14, color: black60);
final b60_12 = TextStyle(fontSize: fs12, color: black60);
final b60_12_600 =
    TextStyle(fontSize: fs12, color: black60, fontWeight: FontWeight.w600);
final b60_10 = TextStyle(fontSize: fs10, color: black60);

final b48_14 =
    TextStyle(fontSize: fs14, color: black48, fontWeight: FontWeight.normal);
final b48_12_600 =
    TextStyle(fontSize: fs12, color: black48, fontWeight: FontWeight.w600);
final b48_13 =
    TextStyle(fontSize: fs13, color: black48, fontWeight: FontWeight.normal);
final b48_12 =
    TextStyle(fontSize: fs12, color: black48, fontWeight: FontWeight.normal);
final b48_10 =
    TextStyle(fontSize: fs10, color: black48, fontWeight: FontWeight.normal);

final b36_14 =
    TextStyle(fontSize: fs14, color: black36, fontWeight: FontWeight.normal);
final b36_12 =
    TextStyle(fontSize: fs12, color: black36, fontWeight: FontWeight.normal);

final appRed_12 = TextStyle(fontSize: fs12, color: Colors.redAccent);

final appOrange_14_600 =
    TextStyle(fontSize: fs14, color: appOrange, fontWeight: FontWeight.w600);
final appOrange_12 = TextStyle(fontSize: fs12, color: appOrange);

final appGreen_14_600 =
    TextStyle(fontSize: fs14, color: appGreen, fontWeight: FontWeight.w600);

final white_14_600 =
    TextStyle(fontSize: fs14, fontWeight: FontWeight.w600, color: white);

final appBarSize = Size.fromHeight(72);

final appPurple_12_600 =
    TextStyle(fontSize: fs12, color: appPurple2, fontWeight: FontWeight.w600);
final appPurple_12 =
    TextStyle(fontSize: fs12, color: appPurple2, fontWeight: FontWeight.w900);
final appPurple_14 = TextStyle(fontSize: fs14, color: appPurple2);
final appPurple_14_600 =
    TextStyle(fontSize: fs14, color: appPurple2, fontWeight: FontWeight.w600);

final w60_12 = TextStyle(fontSize: fs12, color: white.withOpacity(0.6));
final w80_12 = TextStyle(fontSize: fs12, color: white.withOpacity(0.8));
final w90_14 = TextStyle(fontSize: fs14, color: white.withOpacity(0.9));

final grey_14 = TextStyle(fontSize: fs14, color: grey);
final grey_10_600 =
    TextStyle(fontSize: fs10, color: grey, fontWeight: FontWeight.w600);

final cardDecoration = BoxDecoration(
  color: white,
  borderRadius: BorderRadius.all(Radius.circular(6.0)),
  boxShadow: [
    BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.02),
      offset: Offset(0, 4),
      blurRadius: 4,
    )
  ],
);

final cardDecorationDeepShadow = BoxDecoration(
  color: white,
  borderRadius: BorderRadius.all(Radius.circular(8.0)),
  boxShadow: [
    BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.08),
      offset: Offset(0, 4),
      blurRadius: 4,
    )
  ],
);
