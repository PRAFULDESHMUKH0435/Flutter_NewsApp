import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:newsapp/CommonHelperServices/InternetConnectionCheck.dart';
class DetailsScreen extends StatefulWidget {
   String url;
   DetailsScreen({required this.url});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  double _progress =0;
  late InAppWebViewController webview;
  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();
  InternetConnectionCheck check = InternetConnectionCheck();

  @override
  Widget build(BuildContext context) {
    check.checkInternetConnection(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "वार्ताहार",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.grey,
      ),
      body: Stack(
        children: [
          InAppWebView(
            initialUrlRequest: URLRequest(url: WebUri(widget.url)),
            onWebViewCreated: (InAppWebViewController controller) {
              webview = controller;
            },
            onProgressChanged:
                (InAppWebViewController controller, int progress) {
              setState(() {
                _progress = progress / 100;
              });
            },
          ),
          _progress < 1
              ? Center(
                child: SizedBox(
                            height: 30,
                            width: 30,
                            child: CircularProgressIndicator(),
                          ),
              )
              : SizedBox(),
        ],
      ),
    );
  }
}
