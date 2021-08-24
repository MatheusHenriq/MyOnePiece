import 'package:flutter/cupertino.dart';

class TextStyles {
  static const regular = FontWeight.w400;
  static const medium = FontWeight.w500;
  static const semiBold = FontWeight.w600;
  static const bold = FontWeight.w700;
  static const extraBold = FontWeight.w800;

  static const poppins = 'Poppins';

  static const heading1 = TextStyle(
    fontFamily: poppins,
    fontWeight: bold,
    fontSize: 36,
  );

  static const heading2 = TextStyle(
    fontFamily: poppins,
    fontWeight: bold,
    fontSize: 24,
  );

  static const heading3 = TextStyle(
    fontFamily: poppins,
    fontWeight: bold,
    fontSize: 20,
  );

  static const heading4 = TextStyle(
    fontFamily: poppins,
    fontWeight: bold,
    fontSize: 18,
  );
  static const heading5 = TextStyle(
    fontFamily: poppins,
    fontWeight: bold,
    fontSize: 16,
  );
  static const heading6 = TextStyle(
    fontFamily: poppins,
    fontWeight: bold,
    fontSize: 14,
  );
  static const subtitle1 = TextStyle(
    fontFamily: poppins,
    fontWeight: semiBold,
    fontSize: 18,
  );
  static const subtitle2 = TextStyle(
    fontFamily: poppins,
    fontWeight: semiBold,
    fontSize: 16,
  );
  static const bodyText1 = TextStyle(
    fontFamily: poppins,
    fontWeight: regular,
    fontSize: 16,
  );
  static const bodyText2 = TextStyle(
    fontFamily: poppins,
    fontWeight: regular,
    fontSize: 14,
  );
}
