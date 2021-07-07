import 'package:flutter/material.dart';

class Dummy extends StatelessWidget {
  const Dummy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "hi",
        style: new TextStyle(fontSize: 22),
      ),
    );
  }
}
