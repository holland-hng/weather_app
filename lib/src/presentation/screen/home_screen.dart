import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/core/tools/application_context.dart';
import 'package:weather_app/core/widgets/indicator.dart';
import 'package:weather_app/src/domain/events/home_event.dart';
import 'package:weather_app/src/presentation/bloc/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/presentation/widgets/calendar_view.dart';

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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Application.colors.darkBlue,
      body: Column(
        children: [
          CalendartView(),
          CustomRefreshIndicator(
            leadingGlowVisible: false,
            offsetToArmed: 200.0,
            trailingGlowVisible: false,
            builder: customIndicator.builder,
            onRefresh: () => Future.delayed(const Duration(seconds: 2)),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Container(
                height: Application.sizes.height - Application.sizes.appBar,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
