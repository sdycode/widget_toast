// ignore_for_file: invalid_use_of_protected_member

import 'dart:async';

import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:widget_toast/src/toast_widgets/icontoast.dart';
import 'package:widget_toast/src/toast_widgets/toast_position_enum.dart';
import 'package:widget_toast/src/toast_widgets/widgetToast.dart';



class ToastWidget {
  late BuildContext context;
  int _currentRunningFunctionCounter = 0;
  int _lastFunCounter = 0;
  // int _clickCount = 0;

  bool _singleToast = true;

  void changeSingleToast() {
    _singleToast = !_singleToast;
  }

  ToastWidget._();

  static final _instance = ToastWidget._();
  ToastWidget init(BuildContext context) {
    //  ToastWidget._instance.runFutureCalls();
    _instance.context = context;
    return _instance;
  }

  factory ToastWidget() {
    return _instance;
  }

  bool get isDarkMode {
    final brightness = MediaQuery.of(context).platformBrightness;
    return brightness == Brightness.light;
  }
}

class ToastUtil {
  static Future<void> showMessageToast(String msg,
      {int durationInMilliseconds = 1500,
      backgroundColor,
      Widget icon = const FlutterLogo(),
      ToastPosition toastPosition = ToastPosition.bottom}) async {
    Color bgColor = backgroundColor ??
        (ToastWidget._instance.isDarkMode
            ? const Color.fromARGB(255, 253, 251, 251)
            : Colors.black);
    _showMessageToast(
        msg, durationInMilliseconds, icon, bgColor, toastPosition);
  }

  static Future<void> showMessageToastWithIcon(String msg,
      {int durationInMilliseconds = 1500,
      backgroundColor,
      Widget icon = const FlutterLogo(),
      ToastPosition toastPosition = ToastPosition.bottom}) async {
    Color bgColor = backgroundColor ??
        (ToastWidget._instance.isDarkMode
            ? const Color.fromARGB(255, 253, 251, 251)
            : Colors.black);

    _showMessageToastWithIcon(
        msg, durationInMilliseconds, icon, bgColor, toastPosition);
  }

  static Future<void> showWidgetAsToast(Widget child,
      {int durationInMilliseconds = 1500,
      backgroundColor,
      ToastPosition toastPosition = ToastPosition.bottom}) async {
    Color bgColor = backgroundColor ??
        (ToastWidget._instance.isDarkMode
            ? const Color.fromARGB(255, 253, 251, 251)
            : Colors.black);

    _showWidgetAsToast(child, durationInMilliseconds, bgColor, toastPosition);
  }

  Future _makeDelay(int timeInMilliseconds) async {
    await Future.delayed(Duration(milliseconds: timeInMilliseconds));
  }

/*
Snippet for show actual toast fun with periodic timer


 Future<Function> _showMessageToast(){
   int thisFunNo = ToastWidget._instance._lastFunCounter;
    ToastWidget._instance._lastFunCounter++;
    Timer.periodic(const Duration(milliseconds: 200), (timer) async {
      if (thisFunNo == ToastWidget._instance._currentRunningFunctionCounter) {
        ToastWidget._instance._currentRunningFunctionCounter++;
timer.cancel();
      }
    });

}
*/

  static Future _showMessageToast(String msg, int durationInMilliseconds, icon,
      bgColor, ToastPosition toastPosition) async {
    int thisFunNo = ToastWidget._instance._lastFunCounter;
    log('in msg values ${ToastWidget._instance._lastFunCounter} / ${ToastWidget._instance._currentRunningFunctionCounter}  ');
    // ToastWidget._instance._clickCount++;
    Timer.periodic(const Duration(milliseconds: 200), (timer) async {
      // log(' with msg $thisFunNo - ${ToastWidget._instance._lastFunCounter} / ${ToastWidget._instance._currentRunningFunctionCounter} - ${ToastWidget._instance._clickCount} ');

      if (thisFunNo == ToastWidget._instance._currentRunningFunctionCounter) {
        ToastWidget._instance._currentRunningFunctionCounter++;
        // Actual code
        int millisecJumpFactor = 50;
        double value = 0.0;
        double valueJump =
            (1.0) / (durationInMilliseconds / millisecJumpFactor);
        OverlayState? overlaystate =
            Overlay.of(ToastWidget._instance.context, rootOverlay: true);

        OverlayEntry overlayEntry = OverlayEntry(
          builder: (context) {
            double halfH = MediaQuery.of(context).size.height * 0.5;
            switch (toastPosition) {
              case ToastPosition.top:
                return Positioned(
                    top: 50 + 40 * value,
                    left: 50,
                    right: 50,
                    child: ToastIconWidget(value, msg, durationInMilliseconds,
                        icon, bgColor, toastPosition));
              case ToastPosition.middle:
                return Positioned(
                    bottom: halfH - 40 + 40 * value,
                    left: 50,
                    right: 50,
                    child: ToastIconWidget(value, msg, durationInMilliseconds,
                        icon, bgColor, toastPosition));
              case ToastPosition.bottom:
                return Positioned(
                    bottom: 50 + 40 * value,
                    left: 50,
                    right: 50,
                    child: ToastIconWidget(value, msg, durationInMilliseconds,
                        icon, bgColor, toastPosition));

              default:
                return Positioned(
                    bottom: 50 + 40 * value,
                    left: 50,
                    right: 50,
                    child: ToastIconWidget(value, msg, durationInMilliseconds,
                        icon, bgColor, toastPosition));
            }
          },
        );

        overlaystate?.insert(overlayEntry);
        Timer.periodic(Duration(milliseconds: millisecJumpFactor),
            (timer) async {
          if (timer.tick * millisecJumpFactor < durationInMilliseconds) {
            overlaystate!.setState(() {
              value += valueJump;
            });
          } else {
            value = 0.0;
            timer.cancel();
          }
        });

        await Future.delayed(Duration(milliseconds: durationInMilliseconds * 2))
            .whenComplete(() async {
          overlayEntry.remove();
        });
        ToastWidget._instance._lastFunCounter++;

        timer.cancel();
      }
    });
  }

  static Future _showMessageToastWithIcon(
      String msg,
      int durationInMilliseconds,
      icon,
      bgColor,
      ToastPosition toastPosition) async {
    int thisFunNo = ToastWidget._instance._lastFunCounter;

    log('in icon values   $thisFunNo - ${ToastWidget._instance._lastFunCounter} / ${ToastWidget._instance._currentRunningFunctionCounter}  ');

    Timer.periodic(const Duration(milliseconds: 200), (timer) async {
      // log(' with icon $thisFunNo - ${ToastWidget._instance._lastFunCounter} / ${ToastWidget._instance._currentRunningFunctionCounter} - ${ToastWidget._instance._clickCount} ');

      if (thisFunNo == ToastWidget._instance._currentRunningFunctionCounter) {
        ToastWidget._instance._currentRunningFunctionCounter++;

        // actual

        int millisecJumpFactor = 50;
        double value = 0.0;
        double valueJump =
            (1.0) / (durationInMilliseconds / millisecJumpFactor);
        OverlayState? overlaystate =
            Overlay.of(ToastWidget._instance.context, rootOverlay: true);

        OverlayEntry overlayEntry = OverlayEntry(
          builder: (context) {
            double halfH = MediaQuery.of(context).size.height * 0.5;
            switch (toastPosition) {
              case ToastPosition.top:
                return Positioned(
                    top: 50 + 40 * value,
                    left: 50,
                    right: 50,
                    child: ToastIconWidget(value, msg, durationInMilliseconds,
                        icon, bgColor, toastPosition));
              case ToastPosition.middle:
                return Positioned(
                    bottom: halfH - 40 + 40 * value,
                    left: 50,
                    right: 50,
                    child: ToastIconWidget(value, msg, durationInMilliseconds,
                        icon, bgColor, toastPosition));
              case ToastPosition.bottom:
                return Positioned(
                    bottom: 50 + 40 * value,
                    left: 50,
                    right: 50,
                    child: ToastIconWidget(value, msg, durationInMilliseconds,
                        icon, bgColor, toastPosition));

              default:
                return Positioned(
                    bottom: 50 + 40 * value,
                    left: 50,
                    right: 50,
                    child: ToastIconWidget(value, msg, durationInMilliseconds,
                        icon, bgColor, toastPosition));
            }
          },
        );

        overlaystate?.insert(overlayEntry);
        Timer.periodic(Duration(milliseconds: millisecJumpFactor),
            (timer) async {
          if (timer.tick * millisecJumpFactor < durationInMilliseconds) {
            overlaystate!.setState(() {
              value += valueJump;
            });
          } else {
            value = 0.0;
            timer.cancel();
          }
        });

        await Future.delayed(Duration(milliseconds: durationInMilliseconds * 2))
            .whenComplete(() async {
          overlayEntry.remove();
        });
        ToastWidget._instance._lastFunCounter++;
        // done
        timer.cancel();
      }
    });
    // ToastWidget._instance._clickCount++;
  }

  static void _showWidgetAsToast(Widget child, int durationInMilliseconds,
      Color bgColor, ToastPosition toastPosition) async {
    int thisFunNo = ToastWidget._instance._lastFunCounter;

    log('in icon values   $thisFunNo - ${ToastWidget._instance._lastFunCounter} / ${ToastWidget._instance._currentRunningFunctionCounter}  ');

    Timer.periodic(const Duration(milliseconds: 200), (timer) async {
      // log(' with icon $thisFunNo - ${ToastWidget._instance._lastFunCounter} / ${ToastWidget._instance._currentRunningFunctionCounter} - ${ToastWidget._instance._clickCount} ');

      if (thisFunNo == ToastWidget._instance._currentRunningFunctionCounter) {
        ToastWidget._instance._currentRunningFunctionCounter++;

        // actual

        int millisecJumpFactor = 50;
        double value = 0.0;
        double valueJump =
            (1.0) / (durationInMilliseconds / millisecJumpFactor);
        OverlayState? overlaystate =
            Overlay.of(ToastWidget._instance.context, rootOverlay: true);

        OverlayEntry overlayEntry = OverlayEntry(
          builder: (context) {
            double halfH = MediaQuery.of(context).size.height * 0.5;
            switch (toastPosition) {
              case ToastPosition.top:
                return Positioned(
                    top: 50 + 40 * value,
                    left: 50,
                    right: 50,
                    child: WidgetToast(value, durationInMilliseconds, child,
                        bgColor, toastPosition));
              case ToastPosition.middle:
                return Positioned(
                    bottom: halfH - 40 + 40 * value,
                    left: 50,
                    right: 50,
                    child: WidgetToast(value, durationInMilliseconds, child,
                        bgColor, toastPosition));
              case ToastPosition.bottom:
                return Positioned(
                    bottom: 50 + 40 * value,
                    left: 50,
                    right: 50,
                    child: WidgetToast(value, durationInMilliseconds, child,
                        bgColor, toastPosition));

              default:
                return Positioned(
                    bottom: 50 + 40 * value,
                    left: 50,
                    right: 50,
                    child: WidgetToast(value, durationInMilliseconds, child,
                        bgColor, toastPosition));
            }
          },
        );

        overlaystate?.insert(overlayEntry);
        Timer.periodic(Duration(milliseconds: millisecJumpFactor),
            (timer) async {
          if (timer.tick * millisecJumpFactor < durationInMilliseconds) {
            overlaystate!.setState(() {
              value += valueJump;
            });
          } else {
            value = 0.0;
            timer.cancel();
          }
        });

        await Future.delayed(Duration(milliseconds: durationInMilliseconds * 2))
            .whenComplete(() async {
          overlayEntry.remove();
        });
        ToastWidget._instance._lastFunCounter++;
        // done
        timer.cancel();
      }
    });
  }
}
