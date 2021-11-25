import 'package:flutter/material.dart';

class CustomClip extends StatelessWidget {
  final double _screenHeight;
  const CustomClip(this._screenHeight, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData  = Theme.of(context);

    return ClipPath(
      clipper: _BottomShapeClipper(),
      child: Container(
        height: _screenHeight * 0.5,
        color: themeData.primaryColor,
      ),
    );
  }
}

class _BottomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    Offset curveStartPoint = Offset(0, size.height * 0.85);
    Offset curveEndPoint = Offset(size.width, size.height * 0.85);
    path.lineTo(curveStartPoint.dx, curveStartPoint.dy);
    path.quadraticBezierTo(size.width/2, size.height, curveEndPoint.dx, curveEndPoint.dy);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
