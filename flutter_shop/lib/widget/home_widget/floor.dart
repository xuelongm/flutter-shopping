import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Floor extends StatelessWidget {
  final List<Map> floorList;

  const Floor(this.floorList, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = ScreenUtil.screenWidth;
    return Row(children: [
      Expanded(
        child: Column(children: [
          _item(context, this.floorList[0], 400),
          _item(context, this.floorList[1], 200),
        ]),
      ),
      Expanded(
        child: Column(
          children: [
            _item(context, this.floorList[2], 200),
            _item(context, this.floorList[3], 200),
            _item(context, this.floorList[4], 200),
          ],
        ),
      )
    ]);
  }

  Widget _item(BuildContext context, Map item, double height) {
    return Container(
        padding: EdgeInsets.all(4),
        height: ScreenUtil().setHeight(height),
        child: InkWell(
            onTap: () {},
            child: Image.network(
              item['image'],
              fit: BoxFit.cover,
            )));
  }
}
