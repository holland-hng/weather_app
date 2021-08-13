import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/tools/application_context.dart';
import 'package:weather_app/src/domain/events/home_event.dart';
import 'package:weather_app/src/presentation/bloc/home_bloc.dart';

import 'index_date_view.dart';

class CalendartView extends StatelessWidget {
  CalendartView({
    Key? key,
  }) : super(key: key);

  late ScrollController _scrollController = ScrollController(
    initialScrollOffset: Application.sizes.width,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Application.sizes.appBar,
      color: Application.colors.darkBlue,
      child: Column(
        children: [
          SizedBox(
            height: Application.sizes.statusBar,
          ),
          SizedBox(
            height: Application.sizes.appBar - Application.sizes.statusBar,
            child: Stack(
              children: [
                Row(
                  children: [
                    IndexDateView(index: 0),
                    IndexDateView(index: 1),
                    IndexDateView(index: 2),
                    IndexDateView(index: 3),
                    IndexDateView(index: 4),
                    IndexDateView(index: 5),
                    IndexDateView(index: 6),
                  ],
                ),
                BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    return ListView.builder(
                      controller: _scrollController,
                      itemCount: state.calendar?.length ?? 0,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        var _date = state.calendar![index];
                        return GestureDetector(
                          onTap: () {
                            context
                                .read<HomeBloc>()
                                .add(UserSelectDateEvent(index: index % 7));
                          },
                          child: Container(
                            color: Colors.transparent,
                            width: Application.sizes.width / 7,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("${_date.weekday} °c"),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("${_date.month}/${_date.day}"),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  buildWhen: (preState, state) {
                    if (preState.weekType != state.weekType) {
                      double _offset = 0;
                      switch (state.weekType) {
                        case WeekType.last:
                          _offset = 0;
                          break;
                        case WeekType.current:
                          _offset = Application.sizes.width;
                          break;
                        case WeekType.next:
                          _offset = Application.sizes.width * 2;
                          break;
                        default:
                          _scrollController.animateTo(_offset,
                              duration: Duration(milliseconds: 300),
                              curve: Curves.linear);
                      }
                    }
                    return preState.calendar != state.calendar;
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
