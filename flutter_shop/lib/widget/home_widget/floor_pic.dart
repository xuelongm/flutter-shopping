import 'package:flutter/material.dart';

class FloorPic extends StatelessWidget {
  final Map fp;
  const FloorPic(this.fp, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        margin: EdgeInsets.only(top: 10),
        child: InkWell(
            onTap: () {},
            child:
                Image.network(this.fp['PICTURE_ADDRESS'], fit: BoxFit.cover)),
      ),
    );
  }
}
