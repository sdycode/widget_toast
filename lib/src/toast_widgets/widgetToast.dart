import 'package:flutter/material.dart';

class WidgetToast extends StatelessWidget {
  final value;

  final durationInMilliseconds;
  final child;
  final bgColor;
  final toastPosition;
  WidgetToast(this.value, this.durationInMilliseconds, this.child, this.bgColor,
      this.toastPosition,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Opacity(
        opacity: value,
        child: Container(child: child),
      ),
    );
  }
}
