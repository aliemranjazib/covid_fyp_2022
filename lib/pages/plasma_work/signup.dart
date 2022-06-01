import 'package:flutter/material.dart';
import 'package:flutter_application_covid/pages/plasma_work/selectplasma.dart';
import 'package:flutter_application_covid/utils/transitions.dart';
import 'package:flutter_application_covid/widgets/inputfield.dart';
import 'package:flutter_application_covid/widgets/loginbutton.dart';
import 'package:flutter_application_covid/widgets/loginheader.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController? namecontroller;
  TextEditingController? phonecontroller;

  @override
  void initState() {
    super.initState();
    namecontroller = TextEditingController();
    phonecontroller = TextEditingController();
  }

  @override
  void dispose() {
    namecontroller!.dispose();
    phonecontroller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                loginHeader(size: size),
                inputField(
                  controller: namecontroller,
                  prefixIcon: Icons.account_circle_rounded,
                  hintText: "Full Name",
                  textInputType: TextInputType.name,
                  maxLines: 1,
                ),
                SizedBox(height: 25),
                inputField(
                  controller: phonecontroller,
                  prefixIcon: Icons.phone,
                  hintText: "Phone Number",
                  textInputType: TextInputType.phone,
                  maxLines: 1,
                ),
                SizedBox(height: 35),
                loginButton(
                  context: context,
                  text: "Sign In/Up",
                  onTap: () {
                    print("Done");
                    Navigator.pushReplacement(
                      context,
                      SlideLeftRoute(
                        page: SelectPlasma(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
