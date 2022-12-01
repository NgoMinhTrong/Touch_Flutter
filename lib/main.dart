import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mafc_flutter/src/data/db.dart';
import 'package:mafc_flutter/src/screens/intro.dart';
import 'package:mafc_flutter/src/screens/plash.dart';
import 'package:sizer/sizer.dart';

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
  //     overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  // await db.init();
  runApp(App());
}

class App extends StatefulWidget {
  const App({super.key});
  static int time = 1;
  static bool firstCome = true;
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late Timer _timmerInstance;
  bool isInitAll = false;

  void startTimmer() {
    var oneSec = Duration(milliseconds: 1000);
    _timmerInstance = Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (App.time <= 0) {
            _timmerInstance.cancel();
            App.firstCome = false;
          } else {
            App.time--;
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    if (_timmerInstance != null) {
      if (_timmerInstance.isActive) {
        _timmerInstance.cancel();
      }
    }
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    if (App.time > 0) {
      startTimmer();
    }
    db.init().then(
          (value) async => {
            setState(
              () {
                isInitAll = true;
              },
            ),
          },
        );
  }

  @override
  Widget build(BuildContext context) {
    print('======>>  ${App.time}');
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        title: 'Touch flutter',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        home: App.time == 0 ? Intro() : Plash(),
      );
    });
  }
}
