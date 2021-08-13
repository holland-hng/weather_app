import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:preload_page_view/preload_page_view.dart';
import 'package:weather_app/core/tools/app_circle_loadting.dart';
import 'package:weather_app/core/tools/app_size.dart';
import 'package:weather_app/core/tools/application_context.dart';
import 'package:weather_app/core/widgets/indicator.dart';
import 'package:weather_app/src/domain/events/home_event.dart';
import 'package:weather_app/src/presentation/bloc/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/presentation/widgets/calendar_view.dart';
import 'package:weather_app/src/presentation/widgets/progress_view.dart';
import 'package:weather_app/src/presentation/widgets/weahter_page_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CustomIndicatorConfig customIndicator = simpleIndicator;

  @override
  void initState() {
    context.read<HomeBloc>().add(FetchDataEvent());
    //_WeatherPageView = WeatherPageView();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Application.colors.darkBlue,
            flexibleSpace: CalendartView(),
            pinned: true,
          ),
          WeatherPageView()
        ],
      ),
      bottomNavigationBar: Container(
        height: 225 / 414 * Application.sizes.width,
        color: Colors.white,
        margin: EdgeInsets.only(left: 45, right: 45, bottom: 45),
        child: Row(
          children: [
            ProgressView(type: ProgressType.humidity),
            SizedBox(width: 15),
            ProgressView(type: ProgressType.predictability),
          ],
        ),
      ),
    );
  }
}
