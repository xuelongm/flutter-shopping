import 'package:flutter/material.dart';
import '../../config/index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HotGoods extends StatelessWidget {
  final List<Map> hotGoodsList;
  const HotGoods(this.hotGoodsList, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        this._title(),
        this._hotGoods(),
      ],
    ));
  }

  Widget _title() {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      padding: EdgeInsets.all(5.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width: 0.5, color: KColor.defaultBorderColor),
        ),
      ),
      child: Text(
        KString.hotGoodsTitle,
        style: TextStyle(color: KColor.homeSubTitleTextColor),
      ),
    );
  }

  Widget _hotGoods() {
    if (this.hotGoodsList.length > 0) {
      List<Widget> listWidget =
          this.hotGoodsList.map(this._hotGoodItem).toList();
      return Wrap(
        spacing: 2,
        children: listWidget,
      );
    } else {
      return Text('');
    }
  }

  Widget _hotGoodItem(Map item) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: ScreenUtil().setWidth(372),
        color: Colors.white,
        padding: EdgeInsets.all(5.0),
        margin: EdgeInsets.only(bottom: 3.0),
        child: Column(children: [
          Image.network(
            item['image'],
            width: ScreenUtil().setWidth(375),
            height: 200,
            fit: BoxFit.cover,
          ),
          Text(
            item['name'],
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: ScreenUtil().setSp(26)),
          ),
          Row(
            children: [
              Text(
                '￥${item['presentPrice']}',
                style: TextStyle(color: KColor.presentPriceTextColor),
              ),
              Text(
                '￥${item['oriPrice']}',
                style: TextStyle(color: KColor.oriPriceColor),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
