import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_icons/line_icons.dart';
import 'package:soc_leader/domain/auth_state/auth_cubit.dart';
import 'package:soc_leader/domain/event_cubit/event_cubit.dart';
import 'package:soc_leader/domain/navbar_cubit/navbar_cubit.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        // create: (context) => NavbarCubit(),
      providers: [
        BlocProvider(create: (context) => NavbarCubit()),
        BlocProvider(create: (context) => AuthCubit()..checkLoggedIn()),
        BlocProvider(create: (context) => EventCubit())
      ],
        child: Scaffold(
          appBar: AppBar(
            // leading: const Icon(LineIcons.user),
            title: RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: "Соц",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: const Color(0xFF333333),
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1)),
              TextSpan(
                  text: "Лидер",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: const Color(0xFF6C63FF),
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1)),
            ])),
            centerTitle: true,
          ),
          body: BlocBuilder<NavbarCubit, NavbarState>(
            builder: (BuildContext context, state) {
              return state.page;
            },
          ),
          bottomNavigationBar:
              BlocBuilder<NavbarCubit, NavbarState>(builder: (context, state) {
            return BottomNavigationBar(
              onTap: (index) =>
                  context.read<NavbarCubit>().changeBottomNavbar(index),
              selectedItemColor: Colors.black87,
              unselectedItemColor: Colors.black54,
              currentIndex: state.index,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(LineIcons.home), label: "Главная"),
                BottomNavigationBarItem(
                    icon: Icon(LineIcons.calendar), label: "Мероприятия"),
                BottomNavigationBarItem(
                    icon: Icon(LineIcons.users), label: "Сообщество"),
                BottomNavigationBarItem(
                    icon: Icon(LineIcons.heart), label: "Избранное"),
                BottomNavigationBarItem(
                    icon: Icon(LineIcons.user), label: "Профиль"),
              ],
            );
          }),
        ));
  }
}
