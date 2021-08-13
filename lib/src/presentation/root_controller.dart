import 'package:flutter/material.dart';
import 'package:weather_app/core/tools/application_context.dart';

import 'screen/home_screen.dart';

//handle authen if need

class RootController extends StatefulWidget {
  const RootController({Key? key}) : super(key: key);

  @override
  _RootControllerState createState() => _RootControllerState();
}

class _RootControllerState extends State<RootController> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Application.setContext(context);
    return HomeScreen();
  }
}
