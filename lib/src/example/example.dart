

import 'package:flutter/material.dart';
import 'package:widget_toast/widget_toast.dart';



class ToastOverlay extends StatefulWidget {
  ToastOverlay({Key? key}) : super(key: key);

  @override
  State<ToastOverlay> createState() => _ToastOverlayState();
}

class _ToastOverlayState extends State<ToastOverlay> {
  @override
  void initState() {
    // TODO: implement initState
    ToastWidget().init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.only(top: 300),
          height: 70,
          child: ListView(
            reverse: true,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            
            children: [
              const SizedBox(
                width: 50,
              ),
              ElevatedButton(
                  style: _buttonStyle(Colors.pink.shade300),
                  onPressed: () {
                    ToastUtil.showWidgetAsToast(
                        Image.asset(
                          paths[1],
                          width: 100,
                        ),
                        durationInMilliseconds: 1500,
                        backgroundColor: Colors.red,
                        toastPosition: ToastPosition.bottom);
                  },
                  child: const Text('Show Widget as Toast')),
              const SizedBox(
                width: 50,
              ),
              ElevatedButton(
                  style: _buttonStyle(Colors.red.shade300),
                  onPressed: () {
                    ToastUtil.showMessageToastWithIcon("Toast & icon on Top",
                        durationInMilliseconds: 1500,
                        backgroundColor: Colors.red,
                        toastPosition: ToastPosition.top);
                  },
                  child: const Text('Show Overlay Toast & icon on Top')),
              const SizedBox(
                width: 50,
              ),
              ElevatedButton(
                  style: _buttonStyle(Colors.green.shade300),
                  onPressed: () {
                    ToastUtil.showMessageToastWithIcon(
                        "Toast & icon at Center ",
                        durationInMilliseconds: 1500,
                        backgroundColor: Colors.green,
                        toastPosition: ToastPosition.middle);
                  },
                  child: const Text('Show Overlay Toast and icon at Center')),
              const SizedBox(
                width: 50,
              ),
              ElevatedButton(
                  style: _buttonStyle(Colors.purple.shade300),
                  onPressed: () {
                    ToastUtil.showMessageToastWithIcon("Toast & icon at bottom",
                        durationInMilliseconds: 1500,
                        backgroundColor: Colors.purple,
                        toastPosition: ToastPosition.bottom);
                  },
                  child: const Text('Show Overlay Toast and icon at Bottom')),
              const SizedBox(
                width: 50,
              ),
              ElevatedButton(
                  style: _buttonStyle(Colors.black),
                  onPressed: () {
                    ToastUtil.showMessageToast("This is toast",
                        durationInMilliseconds: 1500);
                  },
                  child: const Text('Show Overlay Toast')),
              const SizedBox(
                width: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }

  ButtonStyle _buttonStyle(Color? color) {
    return ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all<Color>(color ?? Colors.purple.shade500));
  }
}

/*
Show toast in flutter without using Flutter Plugin.
Create toast using overlay widget  with animation.
Change opacity and position to get effect of Toast

Source code : https://gist.github.com/sdycode/6f580f49afa779e01230dbe1640c9eb9

Music used in Video :
Music credit goes to Epidemic Sound  :
Turmoil : Rasmus Faber
https://www.epidemicsound.com/artists/rasmus-faber/
*/
