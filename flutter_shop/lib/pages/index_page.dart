import 'package:flutter/material.dart';
import '../provide/current_index_provide.dart';
import '../config/index.dart';
import 'package:provide/provide.dart';
import 'home_page.dart';
import 'category_page.dart';
import 'cart_page.dart';
import 'member_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IndexPage extends StatelessWidget {

  final List<BottomNavigationBarItem> buttonItems = [
    BottomNavigationBarItem(
        icon: Icon(Icons.home), title: Text(KString.homeTitle)), //首页
    BottomNavigationBarItem(
        icon: Icon(Icons.category), title: Text(KString.categoryTitle)), // 分类
    BottomNavigationBarItem(
        icon: Icon(Icons.shopping_cart),
        title: Text(KString.shopingCardTitle)), //购物车
    BottomNavigationBarItem(
        icon: Icon(Icons.person), title: Text(KString.memberTitle))
  ];

  final List<Widget> tabbodies = [
    HomePage(),
    CategoryPage(),
    CartPage(),
    MemberPage()
  ];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
    final currentIndexPage = Provide.value<CurrentIndexProvide>(context);
    print('start index page build ...........................');
    return Provide<CurrentIndexProvide>(
      builder: (context, child, index) {
        return Scaffold(
          backgroundColor: Color.fromRGBO(254, 255, 255, 1),
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: currentIndexPage.currentIndex,
              items: buttonItems,
              onTap: (index) {
                currentIndexPage.setCurrentIndex(index);
              },
              type: BottomNavigationBarType.fixed),
          body: IndexedStack(
              index: currentIndexPage.currentIndex, children: this.tabbodies),
        );
      },
    );
  }
}
