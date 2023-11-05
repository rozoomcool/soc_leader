part of navbar_cubit;

class NavbarState {
  final int index;
  final Widget page;

  NavbarState._(this.index, this.page);

  factory NavbarState.home() => NavbarState._(0, const HomeScreen());
  factory NavbarState.events() => NavbarState._(1, const EventsScreen());
  factory NavbarState.community() => NavbarState._(2, const CommunityScreen());
  factory NavbarState.favorite() => NavbarState._(3, const FavoritesScreen());
  factory NavbarState.profile() => NavbarState._(4, ProfileScreen());
}