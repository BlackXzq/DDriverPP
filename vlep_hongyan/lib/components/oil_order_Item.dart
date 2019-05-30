import 'package:flutter/material.dart';
import '../models/models.dart';
import '../utils/utils.dart';

typedef TapCallback = void Function(OilOrderEntity, bool);

class OilOrderCell extends StatefulWidget {
  final OilOrderEntity entity;
  final TapCallback tapSelectClick;

  OilOrderCell({
    Key key,
    @required this.entity,
    this.tapSelectClick
  }) : super(key: key);

  @override
  _OilOrderCellState createState() => _OilOrderCellState();
}

class _OilOrderCellState extends State<OilOrderCell> {

  bool buttonCanTap = true; //修改按键默认可点击

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    buttonCanTap = !(widget.entity.type == '1');
    setState(() {});
  }

  /*
   * type  true: 点击页面详情  ；false: 点击修改按键
   * */
  void _tapContent(bool isTapContent) {
    LogInfo('isTapContent: $isTapContent');

    if(widget.tapSelectClick != null) {
      widget.tapSelectClick(widget.entity, isTapContent);
    }
  }

  Text _buildNormalText(String title) {
    return Text(
      title,
      style: TextStyle(
        color: VLEPTheme.bodyColor,
        fontSize: VLEPTheme.fontSizeNormal
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double ScreenW = MediaQuery.of(context).size.width;
    final double ScreenH = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(0.0),
                topRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              border: Border.all(color: Color(0xfff2f2f2), width: 1),
              color: Colors.white
          ),
          width: ScreenW,
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: GestureDetector(
            onTap: Feedback.wrapForTap((){_tapContent(true);}, context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 30,
                  color: Colors.white,
                  alignment: Alignment.centerLeft,
                  child: _buildNormalText('调度单号：${widget.entity.scheduleNum}'),
                ),
                Container(
                  height: 30,
                  color: Colors.white,
                  alignment: Alignment.centerLeft,
                  child: _buildNormalText('VAN号：${widget.entity.van}'),
                ),
                Container(
                  height: 30,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      _buildNormalText('上传时间：${widget.entity.uploadTime}'),
                      GestureDetector(
                        onTap: buttonCanTap ? (){_tapContent(false);} : null,
                        child: Container(
                          height: 24,
                          width: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            border: Border.all(color: buttonCanTap ? Color(0xFF97A6FF) : Color(0xFFC3C2C2), width: 1)
                          ),
                          child: Text(
                            '修改',
                            style: TextStyle(
                              fontSize: 12,
                              color: buttonCanTap ? Color(0xFF97A6FF) : Color(0xFFC3C2C2)
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}

