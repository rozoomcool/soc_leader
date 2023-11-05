import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_icons/line_icons.dart';
import 'package:soc_leader/domain/event_cubit/event_cubit.dart';
import 'package:soc_leader/widget/category_button.dart';
import 'package:soc_leader/widget/recommend_event_card.dart';

import '../widget/event_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                RecommendEventCard(),
                RecommendEventCard(),
                RecommendEventCard(),
                RecommendEventCard(),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 18.0),
            child: Text(
              'Популярные🔥',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.w700),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CategoryButton(title: "Все", isPrime: true),
                  CategoryButton(title: "IT", isPrime: false),
                  CategoryButton(title: "Кино", isPrime: false),
                  CategoryButton(title: "Выставки", isPrime: false),
                ],
              ),
            ),
          ),
          BlocBuilder<EventCubit, EventState>(
            builder: (context, state) {
              return GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.all(4.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 2.7 / 4),
                itemBuilder: (context, index) => const EventCard(),
                itemCount: 4,
              );
            }
          )
        ],
      ),
    );
  }
}
