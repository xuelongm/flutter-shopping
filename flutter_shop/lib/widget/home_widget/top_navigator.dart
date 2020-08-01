import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// 分类导航组件
class TopNavigator extends StatelessWidget {
  final List<Map> navagatorList;

  const TopNavigator(this.navagatorList, {Key key}) : super(key: key);

  Widget _gridViewItemUI(BuildContext context, item, index) {
    return InkWell(
        onTap: () {},
        child: Column(
          children: <Widget>[
            Image.network(item['image'], width: ScreenUtil().setWidth(95)),
            Text(item['firstCategoryName'])
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    if (this.navagatorList.length > 10) {
      this.navagatorList.removeRange(10, this.navagatorList.length);
    }
    int navigationIndex = -1;
    return Container(
        color: Colors.white,
        margin: EdgeInsets.only(top: 5.0), // 上边距
        height: ScreenUtil().setHeight(300),
        padding: EdgeInsets.all(3), // 上边距
        child: GridView.count(
          crossAxisCount: 5,
          physics: NeverScrollableScrollPhysics(), // 禁止滚动
          padding: EdgeInsets.all(4),
          children: this.navagatorList.map((item) {
            navigationIndex++;
            return this._gridViewItemUI(context, item, navigationIndex);
          }).toList(),
        ));
  }
}
