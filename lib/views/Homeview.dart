import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:news_app/views/Categoryview.dart';
import 'package:news_app/views/dummy.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Center(
                child: Text(
              'News App',
              style: TextStyle(
                  fontSize: 24, color: Colors.black87, fontFamily: 'Bona'),
            )),
            bottom: TabBar(
              isScrollable: true,
              tabs: [
                Tab(icon: Icon(Icons.analytics_outlined), text: " Business "),
                Tab(icon: Icon(Icons.wine_bar), text: "Entertainment"),
                Tab(icon: Icon(Ionicons.globe), text: " General "),
                Tab(icon: Icon(Ionicons.pulse_sharp), text: "Health"),
                Tab(icon: Icon(Ionicons.magnet_sharp), text: "Science"),
                Tab(
                    icon: Icon(Ionicons.american_football_sharp),
                    text: "Sports"),
                Tab(icon: Icon(Icons.android_rounded), text: "Technology"),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              CategoryView("Business"),
              CategoryView("Entertainment"),
              CategoryView("General"),
              CategoryView("Health"),
              CategoryView("Science"),
              CategoryView("Sports"),
              CategoryView("Technology"),
            ],
          ),
        ),
      ),
    );
  }
}
