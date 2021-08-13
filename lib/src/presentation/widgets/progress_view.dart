import 'package:flutter/material.dart';
import 'package:weather_app/core/tools/application_context.dart';

enum ProgressType {
  humidity,
  predictability,
}

class ProgressView extends StatefulWidget {
  final ProgressType type;
  const ProgressView({Key? key, required this.type}) : super(key: key);

  @override
  _ProgressViewState createState() => _ProgressViewState(type);
}

class _ProgressViewState extends State<ProgressView> {
  final ProgressType type;
  late Color _color;
  late String _title;

  _ProgressViewState(this.type);
  @override
  void initState() {
    switch (type) {
      case ProgressType.humidity:
        _color = Application.colors.lightBlue;
        _title = "Humidity";
        break;
      case ProgressType.predictability:
        _color = Application.colors.purpleBlue;
        _title = "Predictability";
        break;
      default:
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double _widthContainer = (Application.sizes.width - 45 * 2 + 15) / 2;
    return Expanded(
      child: Container(
        height: 225,
        decoration: BoxDecoration(
          color: _color,
          borderRadius: BorderRadius.circular(
            _widthContainer / 2,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              width: _widthContainer - 33 * 2,
              height: _widthContainer - 33 * 2,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius:
                      BorderRadius.circular((_widthContainer - 33 * 2) / 2)),
              child: Stack(
                children: [
                  SizedBox(
                    width: _widthContainer - 33 * 2,
                    height: _widthContainer - 33 * 2,
                    child: RotationTransition(
                      turns: AlwaysStoppedAnimation(0.625),
                      child: CircularProgressIndicator(
                        color: Colors.grey.shade300,
                        strokeWidth: 4,
                        value: 0.75,
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: _widthContainer - 33 * 2,
                    height: _widthContainer - 33 * 2,
                    child: RotationTransition(
                      turns: AlwaysStoppedAnimation(0.625),
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 8,
                        value: 0.5,
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                  ),
                  SizedBox.expand(
                    child: Center(
                      child: Container(
                        width: _widthContainer - 45 * 2,
                        height: _widthContainer - 45 * 2,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                                (_widthContainer - 45 * 2) / 2)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "45",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 3),
                  child: Text(
                    "%",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 3,
            ),
            Text(
              _title,
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
      flex: 1,
    );
  }
}
