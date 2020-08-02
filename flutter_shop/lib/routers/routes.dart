import 'package:fluro/fluro.dart';
import 'package:flutter_shop/routers/details_handler.dart';
import 'package:flutter_shop/routers/not_handler.dart';
class Routes {
  static const String root = '/';
  static const String detailsPage = '/detail';

  static void configureRoutes(Router router) {
    router.notFoundHandler = notHandler;
    router.define(detailsPage, handler: detailsHandler);
  }
}
