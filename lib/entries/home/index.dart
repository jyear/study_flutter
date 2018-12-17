import 'package:flutter/material.dart';
import '../../layout/indexpage/index.dart';

import './components/wechat.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map> bar = [
    {
      'text': '微信',
      "ikey": 'wechat',
      "screen": true,
    },
    {
      'text': '通讯录',
      "ikey": 'contact',
      "screen": false,
    },
    {
      'text': '发现',
      "ikey": 'find',
      "screen": false,
    },
    {
      'text': '我',
      "ikey": 'my',
      "screen": false,
    },
  ];
  String currentKey = 'wechat';

  void _barClick(item, idx) {
    String key = item['ikey'];
    setState(() {
      currentKey = key;
    });
  }

  List<Widget> renderPage() {
    List<Widget> res = [];
    bar.forEach((Map item) {
      res.add(
        GestureDetector(
          onPanStart: (e) {
            print(e);
          },
          onPanUpdate: (e) {
            print(e);
          },
          child: Container(
            width: currentKey == item['ikey']
                ? MediaQuery.of(context).size.width - 3
                : 1,
            child: item['screen'] == true
                ? new WeChat()
                : Container(
                    child: Text(
                      item['text'],
                      style: new TextStyle(
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
            color: Color.fromRGBO(255, 255, 255, 1),
          ),
        ),
      );
    });
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return IndexLayout(
        isFullTop: true,
        barList: bar,
        currentKey: currentKey,
        navClick: _barClick,
        child: Container(
          alignment: Alignment.topLeft,
          width: MediaQuery.of(context).size.width,
          // height: MediaQuery.of(context).size.height,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: renderPage(),
          ),
        ));
  }
}
