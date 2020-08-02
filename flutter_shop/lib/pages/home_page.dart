import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import '../config/index.dart';
import '../service/http_service.dart';
import '../widget/home_widget/index.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  List<Map> hotGoodsList;

  EasyRefreshController _controller;

  ScrollController _scrollController;
  
  // GlobalKey<RefreshState> _footerKey = GlobalKey<RefreshFooterState>();

  bool isEndLoadMore = false;

  @override
  void initState() {
    this.hotGoodsList = [];
    super.initState();
    this._scrollController = new ScrollController();
    this._controller = new EasyRefreshController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 245, 245, 1),
      appBar: AppBar(title: Text(KString.homeTitle)),
      body: FutureBuilder(
          future: request('homePageContent'),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var data = json.decode(snapshot.data.toString());
              final serveData = data['data'] as Map;
              final List<Map> swiperDataList =
                  (serveData['slides'] as List).cast();
              final List<Map> navagatorList =
                  (serveData['category'] as List).cast();
              final List<Map> recommendList =
                  (serveData['recommend'] as List).cast();
              final Map floorPic = (serveData['floor1Pic'] as Map).cast();
              final List<Map> floorList = (serveData['floor1'] as List).cast();
              return EasyRefresh(
                enableControlFinishLoad: true,
                enableControlFinishRefresh: false,
                controller: this._controller,
                scrollController: this._scrollController,
                // header: ClassicalHeader(),
                footer: ClassicalFooter(
                  loadingText: '正在加载...',
                  noMoreText: '没有更多加载内容',
                  showInfo: false,
                ),
                onLoad: () async {
                  this._getHotGoods(0);
                },
                child: ListView(
                  children: <Widget>[
                    SwiperDiy(swiperDataList),
                    TopNavigator(navagatorList),
                    Recommend(recommendList),
                    FloorPic(floorPic),
                    Floor(floorList),
                    HotGoods(this.hotGoodsList),
                  ],
                ),
              );
            } else {
              return Center(
                child: Icon(Icons.cloud_upload),
              );
            }
          }),
    );
  }

  void _getHotGoods(int pageIndex) {
    Map body = {'index': pageIndex};
    request('hotGoods').then((value) {
      final data = json.decode(value.toString());
      this.setState(() {
        this.hotGoodsList.addAll((data['data'] as List).cast());
        this._controller.finishLoad(success: true, noMore: false);
      });
    });
  }
}
