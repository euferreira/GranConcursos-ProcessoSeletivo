import 'package:flutter/material.dart';

class CustomImgAsset extends StatelessWidget {
  final double _size;
  final String _imgName;
  final String _extensao;
  const CustomImgAsset(this._size, this._imgName, this._extensao, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _size,
      child: Image(
        image: AssetImage(
          "assets/images/$_imgName.$_extensao",
        ),
      ),
    );
  }
}
