import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  BottomBar({Key key, this.currentKey = 'wechat', this.barList, this.onTap})
      : super(key: key);
  final String currentKey;
  final List<Map> barList;
  final Function onTap;
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  void _pressClick(Map item, int idx) {
    widget.onTap(item, idx);
  }

  List<Widget> renderBar() {
    List<Widget> res = new List();
    int idx = 0;
    widget.barList.forEach((Map item) {
      int index = idx;
      res.add(
        Expanded(
          child: GestureDetector(
            onTap: () {
              _pressClick(item, index);
            },
            child: Container(
              color: Color.fromRGBO(255, 255, 255, 1),
              alignment: Alignment.center,
              child: Text(item['text'],
                  style: new TextStyle(
                    fontSize: 10,
                    decoration: TextDecoration.none,
                    color: widget.currentKey == item['ikey']
                        ? Color.fromRGBO(152, 195, 121, 1)
                        : Color.fromRGBO(64, 64, 64, 1),
                  )),
            ),
          ),
        ),
      );
      idx++;
    });
    return res;
  }

// decoration: new BoxDecoration(
//         boxShadow: <BoxShadow>[
//           new BoxShadow(
//             color: Color.fromRGBO(40, 40, 40, 0.1),
//             blurRadius: 0.0,
//             spreadRadius: 3.0,
//             offset: Offset(0.0, -0.0),
//           ),
//         ],
//       ),
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            decoration: new BoxDecoration(
              boxShadow: <BoxShadow>[
                new BoxShadow(
                  color: Color.fromRGBO(40, 40, 40, 0.1),
                  blurRadius: 0.0,
                  spreadRadius: 2.0,
                  offset: Offset(0.0, -0.0),
                ),
              ],
              color: Color.fromRGBO(97, 95, 95, 0.3),
            ),
            height: 1,
          ),
          Container(
            height: 50,
            child: Row(
              children: renderBar(),
            ),
          )
        ],
      ),
    );
  }
}
