import 'package:flutter/material.dart';
import 'package:news_app/classes/newsbox.dart';
import 'package:news_app/classes/newscategoryapi.dart';
import 'package:news_app/models/article_model.dart';
import 'dart:async';

class CategoryView extends StatefulWidget {
  final String category;
  CategoryView(this.category);
  @override
  _CategoryViewState createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  late List<Article> newlist;
  bool loading = true;
  Future<void> getData() async {
    ListNews object = new ListNews();
    await object.getNewsForCategory(widget.category);
    newlist = object.newsList;
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return SafeArea(
      child: Scaffold(
          body: loading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Container(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(3, 5, 3, 5),
                      child: ListView.builder(
                        itemCount: newlist.length,
                        scrollDirection: Axis.vertical,
                        physics: ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return NewsBox(
                            newlist[index].urlToImage ?? "",
                            newlist[index].title ?? "",
                            newlist[index].description ?? "",
                            newlist[index].articleUrl ?? "",
                          );
                        },
                      ),
                    ),
                  ),
                )),
    );
  }
}
