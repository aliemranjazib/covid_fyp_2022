// import 'package:covid_plasma_fyp/models/pakistan_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_covid/backend/api.dart';
import 'package:flutter_application_covid/model/pakistan_model.dart';
import 'package:flutter_application_covid/utils/constants.dart';
import 'package:flutter_application_covid/widgets/boxdecoration.dart';
import 'package:flutter_application_covid/widgets/totalstatscard.dart';
import 'package:http/http.dart';

class TotalStatsDashboard extends StatefulWidget {
  @override
  _TotalStatsDashboardState createState() => _TotalStatsDashboardState();
}

class _TotalStatsDashboardState extends State<TotalStatsDashboard> {
  PakistanModel? totalStatsModel;
  bool isloading = true;
  bool errorLoading = false;
  bool isCountry = true;

  void onLoad() async {
    Response response = await getpkCovidStats();
    if (response.statusCode == 200) {
      totalStatsModel = pakistanModelFromJson(response.body);
    } else {
      errorLoading = true;
    }
    isloading = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      onLoad();
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kelectronBlue[800],
          title: Text(
            "Dashboard",
            style: TextStyle(fontSize: 22),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        // body: SingleChildScrollView(
        //   child: Column(
        //     children: [
        //       SizedBox(height: 10),
        //       topButtons(),
        //       SizedBox(height: 20),
        //       (isCountry)
        //           ? countryContainer(size: size)
        //           : statewiseContainer(size: size),
        //     ],
        //   ),
        // ),
        body: SingleChildScrollView(
            child: totalStatsModel != null
                ? Column(
                    children: [
                      SingleChildScrollView(
                        child: Container(
                            margin: EdgeInsets.only(
                              top: 10,
                            ),
                            child: countryContainer(size: size)),
                      ),
                      Column(
                        children: [
                          morestats("cases", "${totalStatsModel!.cases!}"),
                          morestats(
                              "critical", "${totalStatsModel!.critical!}"),
                          morestats("casesPerOneMillion",
                              "${totalStatsModel!.casesPerOneMillion!}"),
                          morestats("deathsPerOneMillion",
                              "${totalStatsModel!.deathsPerOneMillion!}"),
                          morestats("testsPerOneMillion",
                              "${totalStatsModel!.testsPerOneMillion!}"),
                          morestats(
                              "todayCases", "${totalStatsModel!.todayCases!}"),
                          morestats("todayDeaths",
                              "${totalStatsModel!.todayDeaths!}"),
                          morestats(
                              "totalTests", "${totalStatsModel!.totalTests!}"),
                        ],
                      ),
                      // Text(totalStatsModel!.recovered!.toString())
                      // Positioned(
                      //   top: 0,
                      //   left: 0,
                      //   child: Container(
                      //     color: kbackgroundLight,
                      //     padding: EdgeInsets.symmetric(vertical: 5),
                      //     width: size.width,
                      //     child: topButtons(),
                      //   ),
                      // ),
                    ],
                  )
                : Center(child: CircularProgressIndicator())),
      ),
    );
  }

  Widget morestats(String? title, String? value) {
    return totalStatsModel != null
        ? Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 13, vertical: 10),
            padding: EdgeInsets.all(20),
            decoration: newboxDecoration(),
            child: Row(
              children: [
                Text("${title} : "),
                Text("${value}"),
              ],
            ),
          )
        : Center(child: CircularProgressIndicator());
  }

  Widget countryContainer({required Size size}) {
    return totalStatsModel != null
        ? statsCard(
            name: "Pakistan",
            confirmNumber: totalStatsModel!.cases!,
            activeNumber: totalStatsModel!.active!,
            recoveredNumber: totalStatsModel!.recovered!,
            deathNumber: totalStatsModel!.deaths!,
            size: size,
          )
        : Center(child: CircularProgressIndicator());
  }
}
