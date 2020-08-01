import 'package:flutter/material.dart';
import '../widget/category_widget/index.dart';
import '../config/index.dart';

class CategoryPage extends StatefulWidget {
  CategoryPage({Key key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          title: Text(KString.categoryTitle),
        ),
        body: Row(
          children: [
            LeftCategoryNavigator(),
            Column(children: [RightCategoryNavigator()]),
          ],
        ),
      ),
    );
  }
}
