import 'package:flutter/material.dart';

class ToastIconWidget extends StatelessWidget {
  final value;
  final msg;
  final durationInMilliseconds;
  final icon;
  final bgColor;
  final toastPosition;
  ToastIconWidget(this.value, this.msg, this.durationInMilliseconds, this.icon,
      this.bgColor, this.toastPosition,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Opacity(
        opacity: value,
        child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: bgColor, borderRadius: BorderRadius.circular(6)),
            child: Row(
              children: [
                icon,
                Expanded(
                  child: Text(
                    msg,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
