import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import '../widget/category_button.dart';
import '../widget/event_card.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: TextFormField(
              decoration: InputDecoration(
                  fillColor: const Color(0XFFF5F5F5),
                  filled: true,
                  label: const Text("Найти мероприятие"),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(25)),
                  prefixIcon: const Icon(LineIcons.search),
                  suffixIcon: IconButton(
                      onPressed: () {}, icon: const Icon(LineIcons.filter))),
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              "Найдено 56 мероприятий",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          GridView.builder(
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
          )
        ],
      ),
    );
  }
}
