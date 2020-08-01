import 'package:flutter/material.dart';
import './pages/index_page.dart';
import 'package:provide/provide.dart';
import 'config/index.dart';
import 'provide/current_index_provide.dart';

void main() {
  var currentIndexProvide = CurrentIndexProvide();
  var providers = Providers();
  providers
    ..provide(Provider<CurrentIndexProvide>.value(currentIndexProvide));
  runApp(ProviderNode(child: MyApp(), providers: providers));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: KString.mainTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: KColor.primaryColor,
        // primarySwatch: Colors.blue
      ),
      home: IndexPage()
    );
  }
}

