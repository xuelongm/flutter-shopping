import 'package:flutter/material.dart';
import '../model/category_goods_model.dart';


class CategoryGoodsProvide with ChangeNotifier {

  List<CategoryGoodsModel> goodsList = [];

  addGoodsList(List<CategoryGoodsModel> list) {
    this.goodsList.addAll(list);
    print(this.goodsList.length);
    notifyListeners();
  }

  clearGoodsList() {
    this.goodsList.clear();
    notifyListeners();
  }

}