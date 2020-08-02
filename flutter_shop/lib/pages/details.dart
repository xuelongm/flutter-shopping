import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DetailsPage extends StatefulWidget {
  String goodId;

  DetailsPage(this.goodId) {
    print(12212);
  }

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('详情'),
      ),
    );
  }
}
