import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/routers/application.dart';
import 'package:flutter_shop/routers/routes.dart';
import './pages/index_page.dart';
import 'package:provide/provide.dart';
import 'config/index.dart';
import 'provide/index.dart';

void main() {
  final currentIndexProvide = CurrentIndexProvide();
  final categoryProvide = CategoryProvide();
  final categoryGoodsProvide = CategoryGoodsProvide();
  final providers = Providers();
  providers
    ..provide(Provider<CurrentIndexProvide>.value(currentIndexProvide))
    ..provide(Provider<CategoryProvide>.value(categoryProvide))
    ..provide(Provider<CategoryGoodsProvide>.value(categoryGoodsProvide));
  runApp(ProviderNode(child: MyApp(), providers: providers));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Router router = Router();
    Routes.configureRoutes(router);
    Application.router = router;
    return MaterialApp(
        title: KString.mainTitle,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Application.router.generator,
        theme: ThemeData(
          primaryColor: KColor.primaryColor,
          // primarySwatch: Colors.blue
        ),
        home: IndexPage());
  }
}
