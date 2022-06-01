import 'package:flutter/material.dart';
import 'package:flutter_application_covid/pages/plasma_work/donor_list.dart';
import 'package:flutter_application_covid/pages/plasma_work/plasmaform.dart';
import 'package:flutter_application_covid/utils/constants.dart';
import 'package:flutter_application_covid/utils/transitions.dart';
import 'package:flutter_application_covid/widgets/boxdecoration.dart';

class SelectPlasma extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30, bottom: 15),
              child: Text(
                "Choose an option :",
                style: TextStyle(
                  color: kelectronBlue,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            selectPlasmaButton(
              text: "Donate Plasma/Blood",
              onTap: () {
                Navigator.push(
                  context,
                  SlideLeftRoute(page: PlasmaDonate()),
                );
              },
            ),
            selectPlasmaButton(
              text: "Available Donors",
              onTap: () {
                Navigator.push(
                  context,
                  SlideLeftRoute(page: DonorList()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget selectPlasmaButton({
    required String text,
    required Function onTap,
  }) {
    return GestureDetector(
      onTap: onTap as void Function()?,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        padding: EdgeInsets.all(15),
        decoration: newboxDecoration(),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: kelectronBlue,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
