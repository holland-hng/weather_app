import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/common/linear_increase_animation_view.dart';
import 'package:weather_app/core/common/weather_state.dart';
import 'package:weather_app/core/tools/application_context.dart';
import 'package:weather_app/src/presentation/bloc/home_bloc.dart';

class WeatherInfoView extends StatefulWidget {
  final WeekType weekType;
  const WeatherInfoView({Key? key, required this.weekType}) : super(key: key);

  @override
  _WeatherInfoViewState createState() => _WeatherInfoViewState(weekType);
}

class _WeatherInfoViewState extends State<WeatherInfoView> {
  final WeekType weekType;

  _WeatherInfoViewState(this.weekType);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (preState, state) {
        return !(state.isRefreshing ?? true);
      },
      builder: (context, state) {
        if (state.weekType != weekType) {
          return Center(
            child: CircularProgressIndicator(
              color: Application.colors.darkBlue,
            ),
          );
        }
        // Show nodata when fetech data fail
        if (state.failure != null) {
          return Center(
            child: Text(
              "No Data",
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
            ),
          );
        }
        var _weather = state.weather;
        // Show loading animation when loading data
        return state.weather == null
            ? Center(
                child: CircularProgressIndicator(
                  color: Application.colors.darkBlue,
                ),
              )
            //Show weather's info
            : SizedBox.expand(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: Application.sizes.width / 5,
                      height: Application.sizes.width / 5,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(state.weather?.weatherStateAbbr
                                  .getWeatherState()
                                  .pathAsset ??
                              ""),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LinearIncreaseAnimationView(
                          key: UniqueKey(),
                          number: _weather?.theTemp.floor() ?? 0,
                          type: LinearIncreaseAnimationType.text,
                          style: TextStyle(
                            color: Application.colors.darkBlue,
                            fontSize: 70,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "°c",
                          style: TextStyle(
                            color: Application.colors.darkBlue,
                            fontSize: 70,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      _weather?.weatherStateName ?? "",
                      style: TextStyle(
                        color: Application.colors.lightBlue,
                        fontSize: 40,
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
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              );
      },
    );
  }
}
