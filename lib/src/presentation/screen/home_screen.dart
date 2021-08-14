import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:weather_app/core/tools/application_context.dart';
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
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    context.read<HomeBloc>().add(FetchDataEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        physics: NeverScrollableScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: Application.colors.darkBlue,
            flexibleSpace: CalendartView(),
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: Container(
              height: Application.sizes.height -
                  Application.sizes.appBar -
                  45 -
                  225 / 414 * Application.sizes.width,
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  return SmartRefresher(
                    primary: false,
                    controller: _refreshController,
                    enablePullDown: state.isLoading == false,
                    onRefresh: _onRefresh,
                    header: MaterialClassicHeader(
                      color: Application.colors.darkBlue,
                    ),
                    child: WeatherPageView(),
                  );
                },
                buildWhen: (preState, state) {
                  //cancel animation refreshing when reload completed
                  if (preState.isRefreshing != state.isRefreshing &&
                      state.isRefreshing == false) {
                    _refreshController.refreshCompleted();
                  }
                  //just render ui when reload completed
                  return preState.isLoading != state.isLoading ||
                      preState.isRefreshing != state.isRefreshing;
                },
              ),
            ),
          ),
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

  void _onRefresh() async {
    context.read<HomeBloc>().add(RefreshDataEvent());
  }
}
