import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_shop/pages/details.dart';

Handler detailsHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      String goodId = params['id'].first;
      return DetailsPage(goodId);
    }
);
