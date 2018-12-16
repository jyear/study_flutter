import 'package:flutter/material.dart';
//import "package:dart/io";
import '../../layout/indexpage/index.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    return IndexLayout(
        isFullTop: true,
        barList: bar,
        currentKey: currentKey,
        navClick: _barClick,
        child: Container(
          alignment: Alignment.topLeft,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: new Transform(
            transform: new Matrix4.translationValues(0.0, 0.0, 0.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                GestureDetector(
                  onPanStart: (e) {
                    print(e);
                  },
                  onPanUpdate: (e) {
                    print(e);
                  },
                  child: Container(
                    width: currentKey == 'wechat'
                        ? MediaQuery.of(context).size.width - 3
                        : 1,
                    child: Text(
                      "111",
                      style: new TextStyle(
                        decoration: TextDecoration.none,
                      ),
                    ),
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                ),
                GestureDetector(
                  child: Container(
                    width: currentKey == 'contact'
                        ? MediaQuery.of(context).size.width - 3
                        : 1,
                    child: Text(
                      "112",
                      style: new TextStyle(
                        decoration: TextDecoration.none,
                      ),
                    ),
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                ),
                GestureDetector(
                  child: Container(
                    width: currentKey == 'find'
                        ? MediaQuery.of(context).size.width - 3
                        : 1,
                    child: Text(
                      "113",
                      style: new TextStyle(
                        decoration: TextDecoration.none,
                      ),
                    ),
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                ),
                GestureDetector(
                  child: Container(
                    width: currentKey == 'my'
                        ? MediaQuery.of(context).size.width - 3
                        : 1,
                    child: Text(
                      "114",
                      style: new TextStyle(
                        decoration: TextDecoration.none,
                      ),
                    ),
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
