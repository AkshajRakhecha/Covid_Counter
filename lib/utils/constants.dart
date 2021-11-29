import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final monthNames = [
  "January",
  "February",
  "March",
  "April",
  "May",
  "June",
  "July",
  "August",
  "September",
  "October",
  "November",
  "December"
];

final types = {'cases': 'cases', 'recovered': 'recovered', 'deaths': 'deaths'};

//Colors

final List<Color> yellow = [
  Colors.yellow[200],
  Colors.yellow[800],
];
final List<Color> purple = [Colors.deepPurpleAccent, Colors.deepPurple];
final List<Color> blue = [Colors.blue[200], Colors.blue[900]];
final List<Color> red = [Colors.redAccent, Colors.red];
final List<Color> green = [Colors.greenAccent, Colors.green];
final List<Color> white = [Colors.white10, Colors.white70];
final List<Color> indigo = [Colors.indigo[300], Colors.indigo[900]];

final Map<String, List<Color>> colorArray = {
  'yellow': yellow,
  'purple': purple,
  'blue': blue,
  'red': red,
  'green': green,
  'white': white,
  'indigo': indigo,
};

// Text Styles

const kHeaderTextStyle = TextStyle(
  fontSize: 38,
  fontWeight: FontWeight.w600,
  fontFamily: 'ZenTokyoZoo',
  color: kHeaderColor,
);

const kSecondaryTextStyle =
    TextStyle(fontWeight: FontWeight.w500, fontSize: 25, color: kHeaderColor);

const kCaseNameTextStyle =
    TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: kHeaderColor);

const kSecondaryTextStyleWhite = TextStyle(color: Colors.white, fontSize: 29);

const kLastUpdatedTextStyle = TextStyle(color: Colors.grey, fontSize: 15);

const kPrimaryTextStyle =
    TextStyle(fontSize: 24, fontWeight: FontWeight.w400, color: kHeaderColor);
const kTertiaryTextStyle =
    TextStyle(fontSize: 20, fontWeight: FontWeight.w300, color: Colors.white);
// Images

const kAvoidTouchImage = 'assets/avoid-touch.png';
const kCoughImage = 'assets/cough.png';
const kCOVIDImage = 'assets/covid-19.png';
const kDifficultyBreathingImage = 'assets/difficulty-breathing.png';
const kFeverImage = 'assets/fever.png';
const kGermImage = 'assets/germ.png';
const kHandWashImage = 'assets/hand-wash.png';
const kIndiaImage = 'assets/india.png';
const kKeepDistanceImage = 'assets/keep-distance.png';
const kMaskImage = 'assets/mask.png';
const kPandemic_1_Image = 'assets/pandemic-1.png';
const kPandemic_2_Image = 'assets/pandemic-2.png';
const kRunnyNoseImage = 'assets/runny-nose.png';
const kSickImage = 'assets/sick.png';
const kSoreThroatImage = 'assets/sore-throat.png';
const kStayHomeImage = 'assets/stay-home.png';
const kTissueImage = 'assets/tissue.png';
const kCovidIconImage = 'assets/covidicon.png';

var random = Random();

var formatter = NumberFormat("##,##,##,###");

const kBackgroundColor = Color(0xFFFEFEFE);
const kHeaderColor = Color(0xE1C1B7B7);
const kTitleTextColor = Color(0x97C9C9C9);
const kBodyTextColor = Color(0xFFEEE7E7);
const kTextLightColor = Color(0xE1C1B7B7);
const kInfectedColor = Color(0xFFFF8748);
const kDeathColor = Color(0xFFFF4848);
const kRecovercolor = Color(0xFF36C12C);
const kPrimaryColor = Color(0xFF3382CC);
final kShadowColor = Color(0xFFFFF8F8).withOpacity(.16);
final kActiveShadowColor = Color(0xFF4056C6).withOpacity(.15);

// Text Style
const kHeadingTextStyle = TextStyle(
  fontSize: 22,
  fontWeight: FontWeight.w600,
  fontFamily: 'Ubuntu',
);

const kSubTextStyle = TextStyle(
  fontSize: 16,
  color: kTextLightColor,
  fontFamily: 'Ubuntu',
);

const kTitleTextstyle = TextStyle(
  fontFamily: 'Ubuntu',
  fontSize: 18,
  color: kTitleTextColor,
  fontWeight: FontWeight.bold,
);
