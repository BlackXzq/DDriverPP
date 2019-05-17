import 'package:flutter/material.dart';
import '../../utils/utils.dart';


class MyTaskPage extends StatefulWidget {
  @override
  _MyTaskPageState createState() => _MyTaskPageState();
}

class _MyTaskPageState extends State<MyTaskPage> {

  final _tabs = ['待发车','已发车','已送达'];
  static final _bodyKey = GlobalKey<__BodyState>();

  //  发送定位
  void _sendLocation() {
    LogInfo('_sendLocation');
  }
  // 进入设置页面
  void _pushSetPage() {
    LogInfo('_pushSetPage');
  }

  void _pushSearchPage() {
    LogInfo('_pushSearchPage');
  }

  void _backPage() {
    Navigator.of(context).pop();
  }

  Widget _buildCustomAppBar() {
    return Container(
      decoration: BoxDecoration(
          color: VLEPTheme.primaryColor
      ),
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: _backPage,
            child: Icon(
              Icons.keyboard_arrow_left,
              color: Colors.white,
              size: 36,
            ),
          ),
          Expanded(
              child: GestureDetector(
                onTap: _pushSearchPage,
                child: Container(
                  height: 32,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(const Radius.circular(16)),
                    color: Color.fromRGBO(255, 255, 255, 0.3),
                  ),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Image.network(
                          'https://s3.cn-north-1.amazonaws.com.cn/anjiplus-vlep/980d7f43fa44e34cc9c47e34fdf0f2cc8956041886310698250.png',
                          width: 20,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          '请输入调度单号',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: VLEPTheme.fontSizeNormal
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
          ),
        ],
      ),
    );
  }

  List<Widget> _buildTopBarActions() {
    return [
      Padding(
        padding: EdgeInsets.only(right: 20),
        child: GestureDetector(
          onTap: Feedback.wrapForTap(_sendLocation, context),
          child: Image.network(
            'https://s3.cn-north-1.amazonaws.com.cn/anjiplus-vlep/69f8f0d399271a583316dca87bc336d72850209268004796173.png',
            width: 20,
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(right: 10),
        child: GestureDetector(
          onTap: Feedback.wrapForTap(_pushSetPage, context),
          child: Image.network(
            'https://s3.cn-north-1.amazonaws.com.cn/anjiplus-vlep/012b3692b0664cba239e714adb2b53793271175478504097971.png',
            width: 20,
          ),
        ),
      )
    ];
  }

  List<Widget> _buildTab() {
    return _tabs.map<Widget>((name) => Tab(text: name)).toList();
  }


  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: VLEPTheme.primaryColor,
          automaticallyImplyLeading: false,
          title: _buildCustomAppBar(),
          bottom: TabBar(
            tabs: _buildTab()
          ),
          actions: _buildTopBarActions()
        ),
        body: _Body(
          key: _bodyKey,
          tabs: _tabs,
        ),
      ),
    );
  }

}


class _Body extends StatefulWidget {

  final List<String> tabs;

  _Body({
    Key key,
    @required this.tabs
  }) : super(key: key);

  @override
  __BodyState createState() => __BodyState();
}

class __BodyState extends State<_Body> {

  @override
  void initState() {
    super.initState();
  }

  Widget _buildWaitSend(BuildContext context) {
    return Container(
      child: ListView(
      ),
    );
  }

  Widget _buildSended(BuildContext context) {
    return Container(
      color: Colors.teal,
    );
  }

  Widget _buildArrived(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
    );
  }

  Widget _buildTabBarView() {
    return TabBarView(
      children: widget.tabs.map<Widget>((name) => SafeArea(
        top: false,
        bottom: false,
        child: Builder(
          builder: (context) {
            if (name == '待发车') {
              return _buildWaitSend(context);
            } else if (name == '已发车') {
              return _buildSended(context);
            } else if (name == '已送达') {
              return _buildArrived(context);
            }
          },
        ),
      )).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTabBarView();
  }
}


