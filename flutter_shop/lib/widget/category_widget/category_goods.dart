import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import '../../provide/category_goods_provide.dart';
import '../../model/category_goods_model.dart';
import '../../service//http_service.dart';
import '../../config/index.dart';

class CategoryGoods extends StatefulWidget {
  CategoryGoods({Key key}) : super(key: key);

  @override
  _CategoryGoodsState createState() => _CategoryGoodsState();
}

class _CategoryGoodsState extends State<CategoryGoods> {
  EasyRefreshController _controller;

  ScrollController _scrollController;

  @override
  initState() {
    super.initState();
    this._controller = new EasyRefreshController();
    this._scrollController = new ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Provide<CategoryGoodsProvide>(
        builder: (context, child, categoryGoodsProvide) {
      final goodsList = categoryGoodsProvide.goodsList;
      if (!goodsList.isEmpty) {
        return Expanded(
          child: Container(
            width: ScreenUtil().setWidth(570),
            child: EasyRefresh(
              enableControlFinishRefresh: true, // 刷新
              enableControlFinishLoad: true, // 加载
              controller: this._controller,
              scrollController: this._scrollController,
              onRefresh: () async {
                this._refreshCategoodsList();
              },
              onLoad: () async {
                this._getMoreGoodsList();
              },
              footer: ClassicalFooter(
                loadingText: '正在加载',
                showInfo: false,
              ),
              header: ClassicalHeader(
                refreshText: '下拉刷新',
                refreshingText: '正在刷新',
                refreshReadyText: '准备刷新',
                refreshedText: '完成刷新',
                showInfo: false,
              ),
              child: this._goodsListView(goodsList),
            ),
          ),
        );
      } else {
        return Text('暂无数据');
      }
    });
  }

  ListView _goodsListView(List<CategoryGoodsModel> goodsList) {
    return ListView.builder(
        itemCount: goodsList.length,
        itemBuilder: (context, index) {
          return this._goodWidget(context, index, goodsList);
        });
  }

  Widget _goodWidget(context, index, goodsList) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(width: 1.0, color: KColor.defaultBorderColor),
          ),
        ),
        child: Row(
          children: <Widget>[
            _goodsImage(goodsList, index),
            Column(
              children: <Widget>[
                _goodsName(goodsList, index),
                _goodsPrice(goodsList, index),
              ],
            ),
          ],
        ),
      ),
    );
  }

  //商品图片
  Widget _goodsImage(List newList, int index) {
    return Container(
      width: ScreenUtil().setWidth(200),
      child: Image.network(newList[index].image),
    );
  }

  //商品名称
  Widget _goodsName(List newList, int index) {
    return Container(
      padding: EdgeInsets.all(5.0),
      width: ScreenUtil().setWidth(370),
      child: Text(
        newList[index].name,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: ScreenUtil().setSp(28)),
      ),
    );
  }

  //商品价格
  Widget _goodsPrice(List newList, int index) {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      width: ScreenUtil().setWidth(370),
      child: Row(
        children: <Widget>[
          Text(
            '价格:￥${newList[index].presentPrice}',
            style: TextStyle(color: KColor.presentPriceTextColor),
          ),
          Text(
            '￥${newList[index].oriPrice}',
            style: KFont.oriPriceStyle,
          ),
        ],
      ),
    );
  }

  void _getMoreGoodsList() async {
    List<CategoryGoodsModel> goodsList = await this._getGoodList();
    setState(() {
      Provide.value<CategoryGoodsProvide>(context).addGoodsList(goodsList);
      this._controller.finishLoad(success: true);
    });
  }

  void _refreshCategoodsList() async {
    List<CategoryGoodsModel> goodsList = await this._getGoodList();
    setState(() {
      CategoryGoodsProvide categoryGoodsProvide =
          Provide.value<CategoryGoodsProvide>(context);
      categoryGoodsProvide
        ..clearGoodsList()
        ..addGoodsList(goodsList);
      this._controller.finishRefresh(success: true);
    });
  }

  Future<List<CategoryGoodsModel>> _getGoodList() async {
    final val = await request('categoryGoods');
    final data = json.decode(val.toString())['data'];
    final goodsList = new List<CategoryGoodsModel>();
    data.forEach((item) => goodsList.add(CategoryGoodsModel.fromJson(item)));
    return goodsList;
  }
}
