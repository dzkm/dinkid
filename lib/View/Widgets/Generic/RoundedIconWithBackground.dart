import 'package:flutter/material.dart';

class RoundedIconWithBackground extends StatelessWidget {
  final num width;
  final num height;
  final Color boxColor;
  final IconData icon;
  final Color iconColor;
  const RoundedIconWithBackground(
      {Key key,
      num this.width,
      num this.height,
      Color this.boxColor,
      IconData this.icon,
      Color this.iconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width,
      height: this.height,
      decoration: BoxDecoration(
        color: this.boxColor,
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
      child: Icon(
        this.icon,
        color: this.iconColor,
      ),
    );
  }
}
