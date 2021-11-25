import 'package:flutter/material.dart';

class CustomProgress extends StatelessWidget {
  final Color _color;

  const CustomProgress(this._color, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(_color),
        ),
      ),
    );
  }
}
