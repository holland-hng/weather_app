enum HomeEventType {
  swipeNextWeek,
  swipeLastWeek,
  selectDate,
  fetchData,
}

class HomeEvent {
  final HomeEventType type;
  HomeEvent(this.type);
}

class UserSwipeNextWeekEvent extends HomeEvent {
  UserSwipeNextWeekEvent() : super(HomeEventType.swipeNextWeek);
}

class UserSwipeLastWeekEvent extends HomeEvent {
  UserSwipeLastWeekEvent() : super(HomeEventType.swipeLastWeek);
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
