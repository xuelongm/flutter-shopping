import 'package:flutter/material.dart';
import '../../config/index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Recommend extends StatelessWidget {
  final List<Map> recommendList;

  const Recommend(this.recommendList, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 10),
        child: Column(
          children: <Widget>[
            this._titleWidget(),
            this._recommendList(context),
          ],
        ));
  }

  Widget _titleWidget() {
    return Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.fromLTRB(10, 2, 0, 5),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                bottom:
                    BorderSide(width: 0.5, color: KColor.defaultBorderColor))),
        child: Text(KString.recommendText,
            style: TextStyle(color: KColor.homeSubTitleColor)));
  }

  Widget _recommendList(BuildContext context) {
    return Container(
        height: ScreenUtil().setHeight(280),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: this.recommendList.length,
          itemBuilder: (context, index) {
            return this._Item(this.recommendList[index], context);
          },
        ));
  }

  Widget _Item(Map item, BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: ScreenUtil().setWidth(280),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                left:
                    BorderSide(width: 0.5, color: KColor.defaultBorderColor))),
        child: Column(
          children: <Widget>[
            Expanded(
                child: Image.network(
              item['image'],
              fit: BoxFit.cover,
            )),
            Text(
              '¥${item['presentPrice']}',
              style: TextStyle(color: KColor.presentPriceTextColor),
            ),
            Text(
              '¥${item['oriPrice']}',
              style: KFont.oriPriceStyle,
            ),
          ],
        ),
      ),
    );
  }
}
