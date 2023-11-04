import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:soc_leader/widget/event_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: const Icon(LineIcons.user),
        title: RichText(
            text: TextSpan(children: [
          TextSpan(
              text: "Соц",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Color(0xFF333333),
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1)),
          TextSpan(
              text: "Лидер",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Color(0xFF6C63FF),
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1)),
        ])),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 18.0,
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 18.0),
              child: Text(
                'Рекомендации',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(fontWeight: FontWeight.w700),
              ),
            ),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  EventCard(),
                  EventCard(),
                  EventCard(),
                  EventCard(),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 18.0),
              child: Text(
                'Популярные',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
