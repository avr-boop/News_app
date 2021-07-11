import 'package:flutter/material.dart';
import 'package:news_app/views/Articleview.dart';

class NewsBox extends StatefulWidget {
  late final String imgUrl;
  final String title;
  final String desc;
  final String posturl;
  final String content;
  NewsBox(String imgUrl, this.desc, this.title, this.posturl, this.content) {
    /*if (imgUrl == null) {
      this.imgUrl = "https://images.unsplash.com/photo-1594322436404-5a0526db4d13?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8ZXJyb3J8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60";
    }*/
    //else
    //{
    this.imgUrl = imgUrl;
    //}
  }

  @override
  _NewsBoxState createState() => _NewsBoxState();
}

class _NewsBoxState extends State<NewsBox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticleView(
                      postUrl: widget.posturl,
                      imgUrl: widget.imgUrl == null
                          ? "https://images.unsplash.com/photo-1594322436404-5a0526db4d13?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8ZXJyb3J8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"
                          : widget.imgUrl,
                      content: widget.content,
                    )));
      },
      child: Container(
          margin: EdgeInsets.only(bottom: 44),
          width: MediaQuery.of(context).size.width,
          child: Container(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(6),
                      bottomLeft: Radius.circular(6))),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(6, 0, 6, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Image.network(
                          widget.imgUrl,
                          //width: 400,
                          fit: BoxFit.contain,
                        )),
                    SizedBox(
                      height: 22,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      widget.desc,
                      maxLines: 7,
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
