part of event_cubit;

class EventModel extends Equatable {
  final String title;
  final String location;
  final String imageUrl;
  final String link;

  const EventModel(
      {required this.title,
      required this.location,
      required this.imageUrl,
      required this.link});

  @override
  List<Object?> get props => [title, location, imageUrl, link];
}
