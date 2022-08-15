TODO: This package is to show widgets in toast form
## Features

TODO: It has features to show any widget in toast form

## Getting started
<h1>Widget Toast</h1>

TODO: Just import package, call init method in initState and call static method to show toast

## Usage

TODO: it contains sample example whose image is given below.

```dart



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


```

<table>
  <tr>
    <td><img src="https://github.com/sdycode/widget_toast/blob/main/assets/ezgif.com-gif-maker.gif?raw=true" alt = "" width="200"></td>
     <td><img src="https://github.com/sdycode/widget_toast/blob/main/assets/ezgif.com-gif-maker%20(1).gif?raw=true" alt = "" width="200"></td>
      <td><img src="https://github.com/sdycode/widget_toast/blob/main/assets/ezgif.com-gif-maker%20(2).gif?raw=true" alt = "" width="200"></td>
  </tr>
  
 
  <tr>
   <td><img src="https://github.com/sdycode/widget_toast/blob/main/assets/ezgif.com-gif-maker%20(3).gif?raw=true" alt = "" width="200"></td>
    <td><img src="https://github.com/sdycode/widget_toast/blob/main/assets/ezgif.com-gif-maker%20(5).gif?raw=true" alt = "" width="200"></td>
     <td><img src="https://github.com/sdycode/widget_toast/blob/main/assets/Screenrecorder-2022-08-14-22-21-17-629(0).gif?raw=true" alt = "" width="200"></td>
  </tr>
</table>


## Additional information

TODO: In future more animations will be added to show customised toast
