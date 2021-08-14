import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:preload_page_view/preload_page_view.dart';
import 'package:weather_app/src/domain/events/home_event.dart';
import 'package:weather_app/src/presentation/bloc/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'weather_info_view.dart';

class WeatherPageView extends StatefulWidget {
  const WeatherPageView({Key? key}) : super(key: key);

  @override
  _WeatherPageViewState createState() => _WeatherPageViewState();
}

class _WeatherPageViewState extends State<WeatherPageView> {
  late PreloadPageController _controller =
      PreloadPageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    return PreloadPageView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        return WeatherInfoView(weekType: index.getWeekType());
      },
      onPageChanged: (int index) {
        context.read<HomeBloc>().add(UserSwipeWeekEvent(index.getWeekType()));
      },
      preloadPagesCount: 3,
      controller: _controller,
    );
  }
}
