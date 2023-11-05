library navbar_cubit;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soc_leader/presentation/community_screen.dart';
import 'package:soc_leader/presentation/events_screen.dart';
import 'package:soc_leader/presentation/favorites_screen.dart';
import 'package:soc_leader/presentation/home_screen.dart';
import 'package:soc_leader/presentation/profile_screen.dart';

part 'navbar_state.dart';

class NavbarCubit extends Cubit<NavbarState> {
  NavbarCubit(): super(NavbarState.home());

  final List<NavbarState> _states = [
    NavbarState.home(),
    NavbarState.events(),
    NavbarState.community(),
    NavbarState.favorite(),
    NavbarState.profile()
  ];

  changeBottomNavbar(int index) => emit(_states[index]);

}