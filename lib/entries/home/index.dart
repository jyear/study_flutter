import 'package:flutter/material.dart';
import '../../layout/indexpage/index.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return IndexLayout(
      isFullTop: false,
      child: Container(
        child: Text('23232'),
      ),
    );
  }
}
