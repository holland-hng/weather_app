import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/tools/application_context.dart';
import 'package:weather_app/src/presentation/bloc/home_bloc.dart';

class WeatherBaseInfoView extends StatelessWidget {
  const WeatherBaseInfoView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          var _weather = state.weather;
          return Container(
            height: Application.sizes.height - Application.sizes.appBar - 270,
            child: state.weather == null
                ? Center(
                    child: CircularProgressIndicator(
                      color: Application.colors.darkBlue,
                    ),
                  )
                : SizedBox.expand(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/icons/icon_hr.png'),
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${_weather?.theTemp.floor() ?? 0.0}",
                              style: TextStyle(
                                color: Application.colors.darkBlue,
                                fontSize: 100,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "°c",
                              style: TextStyle(
                                color: Application.colors.darkBlue,
                                fontSize: 100,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          _weather?.weatherStateName ?? "",
                          style: TextStyle(
                            color: Application.colors.lightBlue,
                            fontSize: 50,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          _weather?.dateString ?? "",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }
}
