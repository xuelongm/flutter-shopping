import 'package:flutter/material.dart';
import '../model/category_model.dart';

class CategoryProvide with ChangeNotifier {
  List<SecondCategoryVO> secondCategoryList = []; //二级分类列表
  int secondCategoryIndex = 0; //二级分类索引
  int firstCategoryIndex = 0; //一级分类索引
  String firstCategoryId = '4'; //二级ID
  String secondCategoryId = ''; //一级ID
  int page = 1; //列表页数, 当改变一级分类或者二级分类时进行改变
  String noMoreText = ''; //显示更多的表示
  bool isNewCategory = true;

  changeFirstCategory(String firstCategoryId, int firstCategoryIndex) {
    this.firstCategoryId = firstCategoryId;
    this.firstCategoryIndex = firstCategoryIndex;
    this.notifyListeners();
  }

  getSecondCategoryVO(List<SecondCategoryVO> lits, String firstCategoryId) {
    this.firstCategoryId = firstCategoryId;
    this.secondCategoryIndex = 0;
    this.isNewCategory = true;
    this.page = 1;
    this.secondCategoryId = '';
    this.noMoreText = '';
    this.secondCategoryList = [this._allScendCategory()];
    this.secondCategoryList.addAll(lits);
    this.notifyListeners();
  }

  changeSecondIndex(int secondCategoryIndex, String secondCategoryId) {
    this.isNewCategory = true;
    this.secondCategoryIndex = secondCategoryIndex;
    this.secondCategoryId = secondCategoryId;
    this.page = 1;
    this.noMoreText = '';
    this.notifyListeners();
  }

  // 获取全部
  SecondCategoryVO _allScendCategory() {
    SecondCategoryVO all = SecondCategoryVO();
    all.secondCategoryId = '';
    all.firstCategoryId = '00';
    all.secondCategoryName = '全部';
    all.comments = 'null';
    return all;
  }
}
