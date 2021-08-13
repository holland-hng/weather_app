import 'package:weather_app/src/presentation/bloc/home_bloc.dart';

enum HomeEventType {
  swipeWeek,
  selectDate,
  fetchData,
  refreshData,
}

class HomeEvent {
  final HomeEventType type;
  HomeEvent(this.type);
}

class UserSwipeWeekEvent extends HomeEvent {
  final WeekType weekType;
  UserSwipeWeekEvent(this.weekType) : super(HomeEventType.swipeWeek);
}

class UserSelectDateEvent extends HomeEvent {
  final int index;
  UserSelectDateEvent({
    required this.index,
  }) : super(HomeEventType.selectDate);
}

class FetchDataEvent extends HomeEvent {
  FetchDataEvent() : super(HomeEventType.fetchData);
}

class RefreshDataEvent extends HomeEvent {
  RefreshDataEvent() : super(HomeEventType.refreshData);
}
