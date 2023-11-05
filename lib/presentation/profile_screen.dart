import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_icons/line_icons.dart';
import 'package:soc_leader/presentation/auth_screen.dart';

import '../domain/auth_state/auth_cubit.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final Map<String, Widget> _profileElements = {
    "Моя статистика": const Icon(LineIcons.barChartAlt),
    "Мой профиль": const Icon(LineIcons.user),
    "Безопасность": const Icon(LineIcons.lock),
    "Пригласить друзей": const Icon(LineIcons.reply),
    "Оценить приложение": const Icon(LineIcons.star),
    "Выйти из аккаунта": const Icon(LineIcons.doorOpen)
  };

  List<Widget> results = [];

  @override
  Widget build(BuildContext context) {
    if (results.isEmpty) {
      _profileElements.forEach((key, value) {
        Widget tmp = Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: [
              value,
              const SizedBox(
                width: 16.0,
              ),
              Text(key, style: Theme.of(context).textTheme.bodyLarge)
            ],
          ),
        );
        results.add(tmp);
      });
    }

    return BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
      if (state is AuthSuccess) {
        return form(context);
      } else {
        return const AuthScreen();
      }
    });
  }

  Widget form(BuildContext context) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 32,
                  ),
                  const SizedBox(
                    width: 16.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Nickname',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      const Text('username@mail.ru')
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 8.0,
              ),
              const Divider(),
              const SizedBox(
                height: 8.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        "25",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 2.0,
                      ),
                      Text(
                        "Посещено",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "156",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 2.0,
                      ),
                      Text(
                        "Подписчики",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "71",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 2.0,
                      ),
                      Text(
                        "Подписки",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 8.0,
              ),
              const SizedBox(
                height: 4.0,
              ),
              ...results
                  .sublist(0, results.length - 2)
                  .map<Widget>((el) => TextButton(
                        onPressed: () {},
                        child: el,
                      ))
                  .toList(),
              TextButton(
                  onPressed: () => context.read<AuthCubit>().logOut(),
                  child: results.last)
            ],
          ),
        ),
      );
}
