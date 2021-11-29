import 'dart:math';
import 'package:covidcounter/screens/india_home_page.dart';
import 'package:covidcounter/screens/info_screen.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:covidcounter/utils/constants.dart';
import 'package:covidcounter/utils/navigation_transition.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:covidcounter/utils/india.dart';

class AppHeader extends StatelessWidget {
  final headerText;
  final data, name;
  AppHeader({this.headerText, this.name, this.data});
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 2,
      child: Container(
        padding: EdgeInsets.only(bottom: 15, top: 8),
        decoration: BoxDecoration(
            color: Colors.indigo[900],
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 0),
              child: Image.asset(
                kGermImage,
                width: 50,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DataListTile extends StatelessWidget {
  final Color color;
  final int cases;
  final String text;
  DataListTile({this.text, this.color, this.cases});

  @override
  Widget build(BuildContext context) {
    var caseNumber;
    caseNumber = formatter.format(cases);
    return Center(
      child: Container(
        margin: EdgeInsets.all(6),
        height: 70,
        width: MediaQuery.of(context).size.width / 1.2,
        color: Colors.transparent,
        child: Material(
          color: Colors.indigo[900],
          elevation: 2,
          borderRadius: BorderRadius.circular(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 20.0, right: 15),
                    child: CircleAvatar(
                      radius: 8,
                      backgroundColor: color,
                    ),
                  ),
                  Text(
                    caseNumber.toString(),
                    style: kSecondaryTextStyle,
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  text,
                  style: kCaseNameTextStyle,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CaseCard extends StatelessWidget {
  final int totalCases;
  final bool isFlag;
  final String flagURL;
  final color;
  CaseCard({this.totalCases, this.isFlag, this.flagURL, this.color});
  @override
  Widget build(BuildContext context) {
    var formatter = NumberFormat("##,##,##,###");
    var caseNumber;
    caseNumber = formatter.format(totalCases);
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.fromLTRB(20, 5, 20, 10),
      width: MediaQuery.of(context).size.width / 2,
      height: MediaQuery.of(context).size.height / 3,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: color,
          ),
          boxShadow: [BoxShadow(color: Colors.indigo[900], blurRadius: 3)],
          borderRadius: BorderRadius.circular(40)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          !isFlag
              ? Image.asset(
                  kSickImage,
                  height: 80,
                )
              : Image.network(
                  flagURL,
                  width: 80,
                ),
          Padding(
            padding: EdgeInsets.only(top: 5.0, bottom: 5),
            child: Text(
              caseNumber.toString(),
              style: kSecondaryTextStyleWhite,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5.0),
            child: Text(
              'TOTAL CASES',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class DataCard extends StatelessWidget {
  DataCard({
    this.countryUrl,
    this.countryName,
    this.color,
    this.newData,
    this.totalData,
  });

  final String countryUrl, countryName;
  final int totalData, newData;
  final Color color;

  @override
  Widget build(BuildContext context) {
    var totalCaseNumber = formatter.format(totalData);

    return Container(
      margin: EdgeInsets.fromLTRB(6, 0, 6, 10),
      height: 120,
      width: MediaQuery.of(context).size.width / 1.1,
      color: Colors.transparent,
      child: Material(
          color: Colors.indigo[900],
          elevation: 4,
          borderRadius: BorderRadius.circular(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.network(
                    countryUrl,
                    width: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Text(
                      countryName,
                      softWrap: true,
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    totalCaseNumber.toString(),
                    style: kCaseNameTextStyle,
                  ),
                  Text(' ( + '),
                  Text(
                    newData.toString(),
                    style: TextStyle(color: color),
                  ),
                  Text(' )')
                ],
              ),
              Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Icon(Icons.arrow_right),
                ),
              ),
            ],
          )),
    );
  }
}

class BottomMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.transparent,
      child: Container(
        height: MediaQuery.of(context).size.height / 10,
        decoration: BoxDecoration(
            color: Colors.indigo[900],
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            InkWell(
              onTap: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
                Navigator.push(context, SlideRoute(widget: InfoScreen()));
              },
              child: Icon(
                Icons.info_outline,
                size: 40,
                color: kHeaderColor,
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushReplacement(
                    context, SlideRoute(widget: IndiaHomePage()));
              },
              child: Icon(
                Icons.home,
                size: 35,
                color: kHeaderColor,
              ),
            ),
            InkWell(
              onTap: () {
                SystemNavigator.pop(animated: true);
              },
              child: Icon(
                Icons.close,
                size: 40,
                color: kHeaderColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CountryNameHeader extends StatelessWidget {
  final String name, url;

  CountryNameHeader(this.name, this.url);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      padding: EdgeInsets.only(top: 15, bottom: 15),
      constraints: BoxConstraints.tightFor(width: double.infinity),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(5), bottomLeft: Radius.circular(5)),
          color: Colors.indigo[900],
          backgroundBlendMode: BlendMode.colorDodge),
      child: ListTile(
        leading: Image.network(
          url,
          height: 40,
          width: 40,
        ),
        title: Text(
          name.toUpperCase(),
          style: TextStyle(
              fontWeight: FontWeight.w700, fontSize: 25, fontFamily: 'Ubuntu'),
          softWrap: true,
        ),
      ),
    );
  }
}

class ErrorScreen extends StatelessWidget {
  static List<String> imageList = [kPandemic_1_Image, kPandemic_2_Image];
  static final random = new Random();
  final image = imageList[random.nextInt(2)];
  ErrorScreen();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).size.height / 3.5,
        ),
        Image.asset(
          image,
          width: 80,
          height: 80,
        ),
        SizedBox(
          height: 20,
        ),
        Center(
          child: Text(
            ' Connection not available',
            style: kSecondaryTextStyle,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Center(
          child: Text(
            'Please check network',
            style: kCaseNameTextStyle,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Center(
          child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.orange)),
        ),
      ],
    );
  }
}

class CountryDataCard extends StatelessWidget {
  final Color color;
  final String header;
  final int totalCases, newCases;

  CountryDataCard({this.color, this.totalCases, this.header, this.newCases});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.0, 10, 20, 10),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        elevation: 3,
        child: Container(
            padding: EdgeInsets.only(top: 15, bottom: 15),
            decoration: BoxDecoration(
              color: Colors.indigo[900],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: <Widget>[
                Text(
                  header,
                  style: kSecondaryTextStyle,
                ),
                Divider(),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          color: color, borderRadius: BorderRadius.circular(5)),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        formatter.format(totalCases).toString(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Icon(Icons.arrow_upward),
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color(0xff1A237E),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(formatter.format(newCases).toString()),
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}

class BarChart extends StatelessWidget {
  final List<Case> data;
  BarChart(this.data);
  @override
  Widget build(BuildContext context) {
    List<charts.Series<Case, String>> series = [
      charts.Series(
        id: 'New Cases',
        data: data,
        domainFn: (Case cases, int) => cases.type,
        measureFn: (Case cases, int) => cases.value,
        colorFn: (Case cases, int) => cases.barColor,
      )
    ];
    return charts.BarChart(
      series,
      animate: true,
      animationDuration: Duration(seconds: 2),
    );
  }
}

class PercentDataCard extends StatelessWidget {
  final String number;
  final Color color;
  final String title;
  const PercentDataCard({
    Key key,
    this.number,
    this.color,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(6),
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color.withOpacity(.50),
          ),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              border: Border.all(
                color: color,
                width: 2,
              ),
            ),
          ),
        ),
        SizedBox(height: 8),
        RichText(
            text: TextSpan(children: [
          TextSpan(
            text: number,
            style: TextStyle(
              fontSize: 34,
              color: color,
            ),
          ),
          TextSpan(
              text: '%',
              style: TextStyle(
                fontSize: 18,
                color: color,
              )),
        ])),
        Text(title, style: kSubTextStyle),
      ],
    );
  }
}

class Case {
  String type;
  int value;
  Color colorValue;
  charts.Color barColor;
  Case({this.type, this.value, this.colorValue, this.barColor});
}
