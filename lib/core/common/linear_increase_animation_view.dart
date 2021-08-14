import 'package:flutter/material.dart';
import 'package:weather_app/core/common/format_date.dart';

enum LinearIncreaseAnimationType {
  text,
  progress,
}

class LinearIncreaseAnimationView extends StatefulWidget {
  final TextStyle? style;
  final int number;
  final LinearIncreaseAnimationType type;

  const LinearIncreaseAnimationView({
    Key? key,
    this.style,
    required this.number,
    required this.type,
  }) : super(key: key);

  @override
  _LinearIncreaseAnimationViewState createState() =>
      _LinearIncreaseAnimationViewState(style, number, type);
}

class _LinearIncreaseAnimationViewState
    extends State<LinearIncreaseAnimationView> {
  final TextStyle? style;
  final int number;
  final LinearIncreaseAnimationType type;
  late int _sectionTime;
  late int _count;

  _LinearIncreaseAnimationViewState(this.style, this.number, this.type);

  @override
  void initState() {
    _count = 0;
    if (number != 0) {
      _sectionTime = (500 / number).floor();
      _excuteAnimation();
    }
    super.initState();
  }

  Future<void> _excuteAnimation() async {
    for (int i = 0; i < number; i++) {
      await Future.delayed(Duration(milliseconds: _sectionTime), () {
        setState(() {
          _count++;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case LinearIncreaseAnimationType.text:
        return Text(
          FormatDate.format(_count.toString()),
          style: style,
        );
      case LinearIncreaseAnimationType.progress:
        return CircularProgressIndicator(
          color: Colors.white,
          strokeWidth: 8,
          value: 0.75 * _count / 100,
          backgroundColor: Colors.transparent,
        );

      default:
        return SizedBox();
    }
  }
}
