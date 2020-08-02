import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'dart:convert';
import '../../provide/category_provide.dart';
import '../../model/category_model.dart';
import '../../model/category_goods_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../config/index.dart';
import '../../provide/category_goods_provide.dart';
import '../../service/http_service.dart';

class RightCategoryNavigator extends StatefulWidget {
  RightCategoryNavigator({Key key}) : super(key: key);

  @override
  _RightCategoryNavigatorState createState() => _RightCategoryNavigatorState();
}

class _RightCategoryNavigatorState extends State<RightCategoryNavigator> {
  List<SecondCategoryVO> secondCategoryList;

  // TODO 后期添加
  @override
  Widget build(BuildContext context) {
    return Provide<CategoryProvide>(builder: (context, child, value) {
      this.secondCategoryList = value.secondCategoryList;
      if (this.secondCategoryList == null ||
          this.secondCategoryList.length == 0) {
        return Text('');
      }
      // 获取商品
      this._getGoodList();
      return Column(children: [
        Container(
          height: ScreenUtil().setHeight(80),
          width: ScreenUtil().setWidth(570),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(width: 1, color: KColor.defaultBorderColor),
            ),
          ),
          child: this._navigation(context),
        )
      ]);
    });
  }

  ListView _navigation(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: this.secondCategoryList.length,
        itemBuilder: (context, index) {
          return this._navigationItem(context, index);
        });
  }

  // 创建顶部导航拦
  Widget _navigationItem(BuildContext context, int index) {
    final categoryProvide = Provide.value<CategoryProvide>(context);

    bool isClick = categoryProvide.secondCategoryIndex == index;
    final SecondCategoryVO secondCategory = this.secondCategoryList[index];
    return InkWell(
      onTap: () {
        // TODO 后期添加
        categoryProvide.changeSecondIndex(
            index, secondCategory.secondCategoryId);
        this._getGoodList();
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
        child: Text(
          secondCategory.secondCategoryName,
          style: TextStyle(
            fontSize: ScreenUtil().setSp(28),
            color: isClick ? KColor.primaryColor : Colors.black,
          ),
        ),
      ),
    );
  }

  // TODO 后期添加 获取商品列别
  void _getGoodList() {
    request('categoryGoods').then((val){
      final data = json.decode(val.toString());
      List<CategoryGoodsModel> goodsList = new List<CategoryGoodsModel>();
      data['data'].forEach((item) => goodsList.add(CategoryGoodsModel.fromJson(item)));
      Provide.value<CategoryGoodsProvide>(context).addGoodsList(goodsList);
    });
  }
}
