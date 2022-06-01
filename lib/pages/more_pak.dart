import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MorePak extends StatefulWidget {
  const MorePak({Key? key}) : super(key: key);

  @override
  _MorePakState createState() => _MorePakState();
}

class _MorePakState extends State<MorePak> {
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              child: WebView(
                javascriptMode: JavascriptMode.unrestricted,
                initialUrl: "https://covid.gov.pk/stats/punjab",
                onPageFinished: (finish) {
                  setState(() {
                    isLoading = false;
                  });
                },
              ),
            ),
            isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Stack(),
          ],
        ),
      ),
    );
  }
}
