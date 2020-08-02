import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';

Handler notHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
    return Center(
      child: Text('not find'),
    );
  },
);
