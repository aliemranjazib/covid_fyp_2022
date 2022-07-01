// import 'package:covid_app/pages/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_covid/pages/home.dart';
import 'package:flutter_application_covid/pages/self_assesment.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
      routes: {
        '/ques1': (context) => Ques1(),
        '/ques2': (context) => Ques2(),
        '/ques3': (context) => Ques3(),
        '/ques4': (context) => Ques4(),
        '/ques5': (context) => Ques5(),
        '/ques6': (context) => Ques6(),
        '/ques7': (context) => Ques7(),
        '/quesResult': (context) => QuesResult(),
      },
    );
  }
}
