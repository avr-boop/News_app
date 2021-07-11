import 'dart:async';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

class ArticleView extends StatefulWidget {
  final String postUrl;
  final String imgUrl;
  final String content;
  ArticleView(
      {required this.postUrl, required this.imgUrl, required this.content});
  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  /*Future<void> share(dynamic link, String title) async {
    await Share(
        title: 'News Link',
        text: title,
        linkUrl: link,
        chooserTitle: 'Redirect to page');
  }
  */
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "News ",
                style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Bona'),
              ),
              Text(
                "App",
                style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Bona'),
              )
            ],
          ),
          actions: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: IconButton(
                icon: Icon(Icons.share),
                onPressed: () {
                  Share.share(widget.postUrl);
                },
              ),
            ),
          ],
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: WebView(
            initialUrl: widget.postUrl,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
            },
          ),
        ),
      ),
    );
  }
}
