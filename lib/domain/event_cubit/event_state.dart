part of event_cubit;

abstract class EventState {}

class EventStateInitial extends EventState {}

class EventStateLoading extends EventState {}

class EventStateLoaded extends EventState {
  final List<EventModel> events;

  EventStateLoaded({required this.events});
}

class EventStateError extends EventState {}
