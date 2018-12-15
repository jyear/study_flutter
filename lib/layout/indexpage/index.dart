import 'package:flutter/material.dart';
import '../../components/bottombar/index.dart';

class IndexLayout extends StatefulWidget {
  IndexLayout({Key key, this.child, this.isFullTop = true}) : super(key: key);

  final Widget child;
  final bool isFullTop;

  @override
  _IndexLayoutState createState() => _IndexLayoutState();
}

class _IndexLayoutState extends State<IndexLayout> {
  List<Map> bar = [
    {'text': '微信', "ikey": 'wechat'},
    {'text': '通讯录', "ikey": 'contact'},
    {'text': '发现', "ikey": 'find'},
    {'text': '我', "ikey": 'my'},
  ];
  String currentKey = 'wechat';
  void _barClick(item, idx) {
    String key = item['ikey'];
    setState(() {
      currentKey = key;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(255, 255, 255, 1),
      padding: new EdgeInsets.fromLTRB(
          0,
          widget.isFullTop ? MediaQuery.of(context).padding.top : 0,
          0,
          MediaQuery.of(context).padding.bottom),
      child: Column(
        children: <Widget>[
          Expanded(
            child: widget.child,
          ),
          BottomBar(currentKey: currentKey, barList: bar, onTap: _barClick)
        ],
      ),
    );
  }
}
