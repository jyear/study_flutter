import 'package:flutter/material.dart';

class WeChat extends StatefulWidget {
  @override
  _WeChatState createState() => _WeChatState();
}

class _WeChatState extends State<WeChat> {
  bool isEnd = false;
  bool isTop = false;
  List<Map> data = [
    {"name": '张三'},
    {"name": '李四'},
    {"name": '王二'},
    {"name": '麻子'},
    {"name": '张龙'},
    {"name": '赵虎'},
    {"name": '李四'},
    {"name": '王二'},
    {"name": '麻子'},
    {"name": '张龙'},
    {"name": '赵虎'},
    {"name": '麻子'},
    {"name": '张龙'},
    {"name": '赵虎'},
    {"name": '李四'},
    {"name": '王二'},
    {"name": '麻子'},
    {"name": '张龙'},
    {"name": '赵虎'},
  ];
  //渲染列表每个item
  Widget renderTile(BuildContext context, int index) {
    if (index < data.length) {
      Map item = data[index];
      return GestureDetector(
        onTap: () {
          print(item.toString());
        },
        child: Container(
          padding: new EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
          child: Column(
            children: <Widget>[
              Container(
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 50,
                      height: 66,
                      padding: new EdgeInsets.fromLTRB(0, 8.0, 0, 8.0),
                      child: new Image.network(
                        'https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=3829056315,3022032559&fm=173&app=49&f=JPEG?w=640&h=427&s=170A6FA1760A32EE2885D093030090C3',
                        fit: BoxFit.fill,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: new EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Text(
                              item['name'],
                              style: new TextStyle(
                                fontSize: 14,
                                color: Color.fromRGBO(64, 64, 64, 1),
                              ),
                            ),
                            Container(
                              child: Text(
                                '张三丰',
                                style: new TextStyle(
                                    fontSize: 12,
                                    color: Color.fromRGBO(164, 164, 164, 1)),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        '撒旦撒',
                        style: new TextStyle(
                          fontSize: 12,
                          color: Color.fromRGBO(164, 164, 164, 1),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 1,
                decoration:
                    new BoxDecoration(color: Color.fromRGBO(224, 224, 224, 1)),
              ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        height: 0,
      );
    }
  }

  //定义listView 滚动监听
  ScrollController _scrollControllerA = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollControllerA.addListener(() async {
      if (_scrollControllerA.position.pixels ==
          _scrollControllerA.position.maxScrollExtent) {
        setState(() {
          isEnd = true;
          // data.addAll([
          //   {"name": '张龙'},
          //   {"name": '赵虎'},
          //   {"name": '麻子'},
          //   {"name": '张龙'},
          //   {"name": '赵虎'},
          //   {"name": '李四'},
          //   {"name": '王二'},
          //   {"name": '麻子'},
          //   {"name": '张龙'},
          //   {"name": '赵虎'},
          // ]);
        });
        print('滑动到了最底部');
      } else {
        setState(() {
          isEnd = false;
        });
      }
      print(_scrollControllerA.position.pixels);
      if (_scrollControllerA.position.pixels == 0.0) {
        setState(() {
          isTop = true;
        });
        //延迟3秒
        await Future.delayed(Duration(seconds: 3), () {
          setState(() {
            data = List.generate(18, (i) => {"name": "张三" + i.toString()});
            isTop = false;
          });
        });
      } else {
        setState(() {
          isTop = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        isTop
            ? Container(
                alignment: Alignment.center,
                padding: new EdgeInsets.fromLTRB(0, 8, 0, 8),
                child: Text(
                  '正在刷新',
                  style: new TextStyle(
                    color: Color.fromRGBO(224, 224, 224, 1),
                  ),
                ),
              )
            : Container(
                height: 0,
              ),
        Expanded(
          child: ListView.builder(
            itemCount: data.length,
            padding: new EdgeInsets.all(0),
            controller: _scrollControllerA,
            itemBuilder: renderTile,
          ),
        ),
        isEnd
            ? Container(
                alignment: Alignment.center,
                padding: new EdgeInsets.fromLTRB(0, 8, 0, 8),
                child: Text(
                  '正在加载更多',
                  style: new TextStyle(
                    color: Color.fromRGBO(224, 224, 224, 1),
                  ),
                ),
              )
            : Container(
                height: 0,
              )
      ],
    ));
  }
}
