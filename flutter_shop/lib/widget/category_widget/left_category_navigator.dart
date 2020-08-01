import 'package:flutter/material.dart';
import '../../model/category_model.dart';
import '../../service/http_service.dart';
import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../config/index.dart';
import '../../provide/category_provide.dart';
import 'package:provide/provide.dart';

class LeftCategoryNavigator extends StatefulWidget {
  LeftCategoryNavigator({Key key}) : super(key: key);

  @override
  _LeftCategoryNavigatorState createState() => _LeftCategoryNavigatorState();
}

class _LeftCategoryNavigatorState extends State<LeftCategoryNavigator> {
  List<Category> _categoryList;

  int currentIndex = 0;

  _LeftCategoryNavigatorState();

  @override
  void initState() {
    super.initState();
    this._getCategoryList();
  }

  @override
  Widget build(BuildContext context) {
    return Provide<CategoryProvide>(
      builder: (context, child, val) {
        this.currentIndex = val.firstCategoryIndex;
        return Container(
          width: ScreenUtil().setWidth(180),
          decoration: BoxDecoration(
            border: Border(
                right: BorderSide(width: 1, color: KColor.defaultBorderColor)),
          ),
          child: this._getLeftNavigator(),
        );
      },
    );
  }

  Widget _getLeftNavigator() {
    if (this._categoryList == null) {
      return Center(child: Text(''));
    }
    return ListView.builder(
      itemCount: this._categoryList.length,
      itemBuilder: this._leftItem,
    );
  }

  Widget _leftItem(BuildContext context, int index) {
    final isClick = currentIndex == index;
    final currentCounter = Provide.value<CategoryProvide>(context);
    return InkWell(
      onTap: () {
        final currentFirstCategory = this._categoryList[index];
        currentCounter.changeFirstCategory(
            currentFirstCategory.firstCategoryId, index);
        currentCounter.getSecondCategoryVO(
            currentFirstCategory.secondCategories,
            currentFirstCategory.firstCategoryId);
      },
      child: Container(
        height: ScreenUtil().setHeight(90),
        padding: EdgeInsets.only(left: 10, top: 10),
        decoration: BoxDecoration(
          color: isClick ? Color.fromRGBO(236, 238, 239, 1.0) : Colors.white,
          border: Border(
            bottom: BorderSide(width: 1, color: KColor.defaultBorderColor),
            left: BorderSide(
                width: 2, color: isClick ? KColor.primaryColor : Colors.white),
          ),
        ),
        child: Text(
          this._categoryList[index].firstCategoryName,
          style: TextStyle(
            color: isClick ? KColor.primaryColor : Colors.black,
            fontSize: ScreenUtil().setSp(28),
          ),
        ),
      ),
    );
  }

  void _getCategoryList() async {
    final res = await request('category');
    final data = json.decode(res.toString());
    final categoriers = data['data'];
    if (categoriers != null) {
      setState(() {
        this._categoryList = new List<Category>();
        categoriers
            .forEach((item) => this._categoryList.add(Category.fromJSON(item)));
        print(this._categoryList);
      });
    }
  }
}
