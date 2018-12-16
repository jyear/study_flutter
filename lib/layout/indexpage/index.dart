import 'package:flutter/material.dart';
import '../../components/bottombar/index.dart';

class IndexLayout extends StatefulWidget {
  IndexLayout(
      {Key key,
      this.child,
      this.isFullTop = true,
      this.barList,
      this.currentKey,
      this.navClick})
      : super(key: key);

  final Widget child;
  final bool isFullTop;
  final List<Map> barList;
  final String currentKey;
  final Function navClick;

  @override
  _IndexLayoutState createState() => _IndexLayoutState();
}

class _IndexLayoutState extends State<IndexLayout> {
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
          BottomBar(
            currentKey: widget.currentKey,
            barList: widget.barList,
            onTap: widget.navClick,
          ),
        ],
      ),
    );
  }
}
