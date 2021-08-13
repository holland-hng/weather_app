import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/tools/application_context.dart';
import 'package:weather_app/src/domain/events/home_event.dart';
import 'package:weather_app/src/presentation/bloc/home_bloc.dart';

class IndexDateView extends StatefulWidget {
  final int index;
  const IndexDateView({
    Key? key,
    this.index = 1,
  }) : super(key: key);

  @override
  _IndexDateViewState createState() => _IndexDateViewState(index);
}

class _IndexDateViewState extends State<IndexDateView> {
  final int index;
  late HomeBloc _bloc;

  _IndexDateViewState(this.index);

  @override
  void initState() {
    _bloc = context.read<HomeBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            gradient: index == state.index
                ? LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Application.colors.darkBlue,
                      Application.colors.semiDarkBlue,
                      Application.colors.mediumBlue,
                      Application.colors.lightBlue,
                    ],
                  )
                : null,
          ),
          width: Application.sizes.width / 7,
        );
      },
      buildWhen: (preState, state) {
        return preState.index != state.index;
      },
    );
  }
}
