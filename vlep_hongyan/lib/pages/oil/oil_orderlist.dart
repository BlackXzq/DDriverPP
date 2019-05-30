import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'dart:async';

import '../../components/components.dart';
import '../../models/models.dart';
import '../../services/services.dart';
import '../../utils/utils.dart';
import '../pages.dart';


class OilOrderListPage extends StatelessWidget {

  static final _bodyKey = GlobalKey<__BodyState>();
  
  @override
  Widget build(BuildContext context) {

    Widget _buildBottomBtn() {
      return Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Color(0xfff2f2f2), width: 1),
            ),
          ),
          Container(
            constraints: BoxConstraints.expand(
                width: 200,
                height: 40
            ),
            decoration: BoxDecoration(
                color: VLEPTheme.primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(20))
            ),
            child: FlatButton(
              onPressed: (){
                Navigator.of(context).pushNamed('/add_Oil');
              },
              child: Text(
                '新增油票上传',
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('油票管理'),
      ),
      body: _Body(key: _bodyKey),
      bottomSheet: _buildBottomBtn(),
    );
  }
}


class _Body extends StatefulWidget {
  _Body({
    Key key,
  }) : super(key: key);

  @override
  __BodyState createState() => __BodyState();
}

enum LoadType {
  normal,
  pull,
  loadMore
}

class __BodyState extends State<_Body> {

  var _isLoading = false;
  List<OilOrderEntity> entityList = [];

  int pageSize = 10;
  int pageNo = 1;

  final _scrollController = ScrollController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _scrollController.addListener(_scrollListener);

    _loadOrderList(type: LoadType.normal);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {

    if (_scrollController.position.pixels > _scrollController.position.maxScrollExtent + 50) {
      _loadOrderList(type: LoadType.loadMore);
    }
  }

  void _loadOrderList({
    LoadType type = LoadType.normal,
    Completer<Null> completer
  }) {

    if(_isLoading) {
      completer?.complete();
      return;
    }

    setState(() {
      _isLoading = true;
    });

    if(type == LoadType.loadMore) {
      pageNo = pageNo + 1;
    } else {
      pageNo = 1;
    }

    OilRequest.getOilOrderList(
      pageNo: pageNo,
      onSucceed: (List<OilOrderEntity> list) {
        if (type == LoadType.loadMore) {
          if (list.length == 0) {
            pageNo = pageNo - 1;
            VLEPToast.showToast(msg: '没有更多信息了');
          } else {
            var temList = list.map((item) => item).toList();
            entityList.addAll(temList);
          }
        } else {
          entityList = list;
        }
        setState(() {
          _isLoading = false;
        });
        completer?.complete();
      },
      onFailed: (notice) {
        completer?.complete();
        VLEPToast.showToast(msg: notice.message);
        if (type == LoadType.loadMore) {
          pageNo = pageNo - 1;
        }
        setState(() {
          _isLoading = false;
        });
      }
    );
  }

  Future<Null> _refresh() {
    final completer = Completer<Null>();
    _loadOrderList(
        type: LoadType.pull,
        completer: completer
    );
    return completer.future;
  }

  //点击选择订单列表
  void selectTapOrder(OilOrderEntity entity, bool isTapContent) {
    //isTapContent： true 进入页面详情； false 进入修改页
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => OrderDetailPage(
      driverId: entity.driverId,
      tknum: entity.tknum,
      isDetail: isTapContent,
    )));
  }

  Widget _buildEmptyContent() {
    return Visibility(
      visible: entityList.isEmpty,
      child: Center(
          child: Container(
              margin: EdgeInsets.only(bottom: 80),
              child: GestureDetector(
                onTap: Feedback.wrapForTap((){
                  _loadOrderList();
                }, context),
                child: Image.network(
                  'https://s3.cn-north-1.amazonaws.com.cn/anjiplus-vlep/c027f16438d983b873a6b7f8444c57623061974312310001979.png',
                  width: 200,
                  height: 180,
                ),
              )
          )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(bottom: 70),
          child: RefreshIndicator(
            onRefresh: _refresh,
            child: ListView.separated(
              controller: _scrollController,
              physics: const AlwaysScrollableScrollPhysics(),
              separatorBuilder: (context, index) => Container(),
              itemCount: entityList.length,
              itemBuilder: (context, index) => OilOrderCell(
                key: Key(entityList[index].scheduleNum),
                entity: entityList[index],
                tapSelectClick: selectTapOrder,
              ),
            ),
          ),
        ),
        _buildEmptyContent(),
        Visibility(
          visible: _isLoading,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        )
      ],
    );
  }
}
