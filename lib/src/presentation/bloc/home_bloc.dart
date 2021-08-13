import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app/core/error/failures.dart';
import 'package:weather_app/src/domain/entities/weather_entity.dart';
import 'package:weather_app/src/domain/events/home_event.dart';
import 'package:weather_app/src/domain/repositories/home_repository.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this._repository) : super(HomeState());
  final HomeRepository _repository;

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    switch (event.type) {
      case HomeEventType.swipeWeek:
        yield* _handleSwipeWeek(event as UserSwipeWeekEvent);
        break;
      case HomeEventType.selectDate:
        yield* _handleSelectDate(event as UserSelectDateEvent);
        break;
      case HomeEventType.fetchData:
        yield* _handleFetchData(event as FetchDataEvent);
        break;
      case HomeEventType.refreshData:
        yield* _handleRefresh(event as RefreshDataEvent);
        break;
      default:
    }
  }

  Stream<HomeState> _handleRefresh(RefreshDataEvent event) async* {
    yield state.copyWith(
      isRefreshing: true,
    );
    add(UserSelectDateEvent(index: state.index ?? 0));
    return;
  }

  Stream<HomeState> _handleSwipeWeek(UserSwipeWeekEvent event) async* {
    yield state.copyWith(weekType: event.weekType);
    add(UserSelectDateEvent(index: state.index ?? 0));
    return;
  }

  Stream<HomeState> _handleFetchData(FetchDataEvent event) async* {
    DateTime _now = DateTime.now();

    DateTime _start = _now.subtract(Duration(days: 7));
    List<DateTime> _calendar = [];
    for (int i = 0; i < 21; i++) {
      final _date = _start.add(Duration(days: i));
      _calendar.add(_date);
    }
    yield state.copyWith(calendar: _calendar);
    add(UserSelectDateEvent(index: 0));
    return;
  }

  Stream<HomeState> _handleSelectDate(UserSelectDateEvent event) async* {
    DateTime _date = state.calendar == null
        ? DateTime.now()
        : state.calendar![event.index + state.weekType!.value * 7];
    yield state.copyWith(
      date: _date,
      index: event.index,
      isLoading: true,
      weather: null,
      failure: null,
    );
    final _result = await _repository.getWeather(_date);
    yield _result.when(
      (error) {
        return state.copyWith(
          weather: null,
          failure: error,
          isLoading: false,
          isRefreshing: false,
        );
      },
      (weather) {
        return state.copyWith(
          weather: weather,
          failure: null,
          isLoading: false,
          isRefreshing: false,
        );
      },
    );
  }
}

enum WeekType {
  current,
  last,
  next,
}

extension WeekTypeExtension on WeekType {
  int get value {
    switch (this) {
      case WeekType.last:
        return 0;
      case WeekType.current:
        return 1;
      case WeekType.next:
        return 2;
      default:
        return 0;
    }
  }
}

extension WeekTypeFromIntExtion on int {
  WeekType getWeekType() {
    switch (this) {
      case 0:
        return WeekType.last;
      case 1:
        return WeekType.current;
      default:
        return WeekType.next;
    }
  }
}

class HomeState extends Equatable {
  final WeatherEntity? weather;
  final Failure? failure;
  final DateTime? date;
  final int? index;
  final WeekType? weekType;
  final List<DateTime>? calendar;
  final bool? isLoading;
  final bool? isRefreshing;

  HomeState({
    this.isLoading,
    this.isRefreshing,
    this.date,
    this.index = 0,
    this.weekType = WeekType.current,
    this.weather,
    this.failure,
    this.calendar,
  });

  HomeState copyWith({
    WeatherEntity? weather,
    Failure? failure,
    DateTime? date,
    WeekType? weekType,
    int? index,
    List<DateTime>? calendar,
    bool? isLoading,
    bool? isRefreshing,
  }) {
    return HomeState(
      weather: weather,
      failure: failure,
      date: date ?? this.date,
      index: index ?? this.index,
      weekType: weekType ?? this.weekType,
      calendar: calendar ?? this.calendar,
      isLoading: isLoading ?? this.isLoading,
      isRefreshing: isRefreshing ?? this.isRefreshing,
    );
  }

  @override
  List<Object?> get props => [weather, failure, weekType, index, date];
}
