import 'package:flutter/material.dart';
import 'package:weather_app/core/tools/application_context.dart';

class NetworkStatusPopup {
  static void hide() {
    ScaffoldMessenger.of(Application.rootContext).hideCurrentSnackBar();
  }

  static void show() {
    final snackBar = SnackBar(
      content: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error,
            color: Colors.orangeAccent,
            size: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5, top: 4),
            child: Text(
              "Network connection not available",
              style: TextStyle(fontSize: 15, height: 1.3),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      duration: Duration(days: 365),
    );
    ScaffoldMessenger.of(Application.rootContext).showSnackBar(snackBar);
  }
}
