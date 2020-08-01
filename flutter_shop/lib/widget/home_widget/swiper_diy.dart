import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SwiperDiy extends StatelessWidget {
  final List<Map> swiperDataList;

  const SwiperDiy(this.swiperDataList, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: ScreenUtil().setHeight(333),
      width: ScreenUtil().setHeight(750),
      child: Swiper(
        itemCount: this.swiperDataList.length,
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
            this.swiperDataList[index]['image'],
            fit: BoxFit.cover,
          );
        },
        autoplay: true,
        scrollDirection: Axis.horizontal,
        pagination: SwiperPagination(
          alignment: Alignment.bottomCenter 
        )
      ),
    );
  }
}
