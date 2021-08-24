import 'package:animatedcontroller/utils/textstyles_models.dart';
import 'package:flutter/material.dart';

const API = 'https://onepiececover.com/api/chapters/';

const OnePieceChapterSearch =
    """{"id":1,"title":"Romance Dawn - The Dawn of the Adventure","chapter":"One Piece Chapter 1","cover_images":"https://res.cloudinary.com/daluwid/image/upload/v1589383457/aruhkvluafy7zbftboix.png|https://res.cloudinary.com/daluwid/image/upload/c_fill,q_auto,w_450/aruhkvluafy7zbftboix.png","summary":"The series' main character, Monkey D. Luffy, is introduced as a boy, with Shanks as its role model. After Shanks comes into confrontation at a bar with a mountain bandit, it's discovered that Luffy mistakenly ate a Devil Fruit, the Gomu Gomu no Mi. Later he is taken hostage after Luffy provokes Higuma. Shanks and his crew appear and defeat the bandits of Higuma but Higuma escapes and takes Luffy on a boat. A Sea King emerges and eats Higuma after Higuma pushes Luffy into the water and Shanks arrives just in time to save Luffy's life. Shanks uses Haki to scare off the Sea King, but loses his arm in the process. Luffy is even more determined to become a pirate when Shanks lost his left arm to save him. He gives Luffy his straw hat, before Shanks leaves.10 Years on,  Luffy officially sets sail as a pirate and begins the adventure of fulfilling his dream of becoming the King of Piracy. ","characters":"Shanks, Benn Beckman, Lucky Roux, Yasopp, Gold Roger (flashback), Monkey D. Luffy, Makino, Woop Slap, Gyoru, Chicken, Anjo (flashback), Lord of the Coast, Monstar, Higuma, Mikio Itoo (on wanted poster)","cover_characters":"Nami","publish":"","explanation":"Color Spread: The Straw Hat Pirates and the Red Hair Pirates are holding a party in treasure along with seagulls. Shanks' flag is seen in the background. ","created_at":"2020-05-03 21:50:49","updated_at":"2020-05-13 23:24:18","theories":[]}""";

const OnePieceChapterSearch2 =
    """{"items":[{"id":985,"chapter":"One Piece Chapter 985","title":"The plan for a new Onigashima"}]}""";

const kLightThemeTextColor = Colors.black;
const kDarkThemeTextColor = Colors.white;

final ThemeData appLightTheme = ThemeData(
  textTheme: TextTheme(
    headline1: TextStyles.heading1.apply(
      color: kLightThemeTextColor,
    ),
    headline2: TextStyles.heading2.apply(
      color: kLightThemeTextColor,
    ),
    headline3: TextStyles.heading3.apply(
      color: kLightThemeTextColor,
    ),
    headline4: TextStyles.heading4.apply(
      color: kLightThemeTextColor,
    ),
    headline5: TextStyles.heading5.apply(
      color: kLightThemeTextColor,
    ),
    headline6: TextStyles.heading6.apply(
      color: kLightThemeTextColor,
    ),
    subtitle1: TextStyles.subtitle1.apply(
      color: kLightThemeTextColor,
    ),
    subtitle2: TextStyles.subtitle2.apply(
      color: kLightThemeTextColor,
    ),
    bodyText1: TextStyles.bodyText1.apply(
      color: kLightThemeTextColor,
    ),
    bodyText2: TextStyles.bodyText2.apply(
      color: kLightThemeTextColor,
    ),
  ),
  primaryColor: Color(0xff00B9FF),
  brightness: Brightness.dark,
  accentColor: Color(0xff128FBE),
  highlightColor: Color(0xffffffff),
  hintColor: Color(0xff000000),
);

final ThemeData appDarkTheme = ThemeData(
  textTheme: TextTheme(
    headline1: TextStyles.heading1.apply(
      color: kDarkThemeTextColor,
    ),
    headline2: TextStyles.heading2.apply(
      color: kDarkThemeTextColor,
    ),
    headline3: TextStyles.heading3.apply(
      color: kDarkThemeTextColor,
    ),
    headline4: TextStyles.heading4.apply(
      color: kDarkThemeTextColor,
    ),
    headline5: TextStyles.heading5.apply(
      color: kDarkThemeTextColor,
    ),
    headline6: TextStyles.heading6.apply(
      color: kDarkThemeTextColor,
    ),
    subtitle1: TextStyles.subtitle1.apply(
      color: kDarkThemeTextColor,
    ),
    subtitle2: TextStyles.subtitle2.apply(
      color: kDarkThemeTextColor,
    ),
    bodyText1: TextStyles.bodyText1.apply(
      color: kDarkThemeTextColor,
    ),
    bodyText2: TextStyles.bodyText2.apply(
      color: kDarkThemeTextColor,
    ),
  ),
  primaryColor: Color(0xff1B3240),
  brightness: Brightness.light,
  accentColor: Color(0xff882C9F),
  highlightColor: Color(0xff1B2631),
  hintColor: Color(0xffffffff),
);
