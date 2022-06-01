import 'dart:io';

import 'package:flutter_application_covid/pages/FAQ.dart';
import 'package:flutter_application_covid/pages/covidNews.dart';
import 'package:flutter_application_covid/pages/google_Map.dart';
import 'package:flutter_application_covid/pages/live_count.dart';
import 'package:flutter_application_covid/pages/more_pak.dart';
import 'package:flutter_application_covid/pages/plasma_work/selectplasma.dart';
import 'package:flutter_application_covid/pages/preventions.dart';
import 'package:flutter_application_covid/pages/stats.dart';
import 'package:flutter_application_covid/pages/symptoms.dart';
import 'package:flutter_application_covid/utils/junction_top_stack.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:ui';

class CovidCount extends StatefulWidget {
  const CovidCount({Key? key}) : super(key: key);

  @override
  _CovidCountState createState() => _CovidCountState();
}

class _CovidCountState extends State<CovidCount> {
  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceWebView: true,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              junctionTopStack(),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  containers(
                      size: size,
                      colour: Colors.red,
                      text: "Symptoms",
                      context: context,
                      pageName: BoardingSymptoms(),
                      img: "breathing.png"),
                  containers(
                      size: size,
                      colour: Colors.blue,
                      text: "Preventive Measures",
                      context: context,
                      pageName: preventions(),
                      img: "wear_mask.png"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 180,
                    width: 150,
                    // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                    child: Stack(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if (Platform.isAndroid || Platform.isLinux) {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => faqQue(),
                                ),
                              );
                            } else {
                              _launchURL(
                                  'https://www.cdc.gov/coronavirus/2019-ncov/faq.html');
                            }
                          },
                          child: Container(
                            height: 100,
                            width: size.width / 2.2,
                            margin: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 30),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.purple,
                            ),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 45,
                                ),
                                Text(
                                  "FAQ's",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          left: 40,
                          bottom: 105,
                          child: Image.asset(
                            "assets/question.png",
                            width: 73,
                            height: 73,
                          ),
                        )
                      ],
                    ),
                  ),
                  containers(
                      size: size,
                      colour: (Colors.indigo[800])!,
                      text: "World Live Count",
                      context: context,
                      pageName: liveCount(),
                      img: "earth.png"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  containers(
                      size: size,
                      colour: (Colors.indigo[800])!,
                      text: "Plasma",
                      context: context,
                      pageName: SelectPlasma(),
                      img: "plasma.png"),
                  Container(
                    height: 180,
                    width: 150,
                    // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                    child: Stack(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if (Platform.isAndroid || Platform.isLinux) {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => MorePak(),
                                ),
                              );
                            } else {
                              _launchURL('https://covid.gov.pk/stats/punjab');
                            }
                          },
                          child: Container(
                            height: 100,
                            width: size.width / 2.2,
                            margin: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 30),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                            ),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 45,
                                ),
                                Text(
                                  "More",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          left: 40,
                          bottom: 105,
                          child: Image.asset(
                            "assets/covid.png",
                            width: 73,
                            height: 73,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  containers(
                      size: size,
                      colour: (Colors.indigo[800])!,
                      text: "Pakistan",
                      context: context,
                      pageName: TotalStatsDashboard(),
                      img: "pak.jpg"),
                  containers(
                      size: size,
                      colour: (Colors.teal[800])!,
                      text: "Covid News and Updates",
                      context: context,
                      pageName: CovidNews(),
                      img: "news.png"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget containers(
    {required Size size,
    required Color colour,
    required String img,
    required var pageName,
    required var context,
    required String text}) {
  return Container(
    height: 180,
    width: 150,
    // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
    child: Stack(
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => pageName),
            );
          },
          child: Container(
            height: 100,
            width: size.width / 2.2,
            margin: EdgeInsets.symmetric(horizontal: 5, vertical: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: colour,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 45,
                ),
                Text(
                  "$text",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: 40,
          bottom: 105,
          child: Image.asset(
            "assets/$img",
            width: 73,
            height: 73,
          ),
        )
      ],
    ),
  );
}
