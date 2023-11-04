import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class EventCard extends StatelessWidget {
  const EventCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 12),
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 20)],
            borderRadius: BorderRadius.circular(50)),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.asset(
                  width: 291,
                  height: 239,
                  'assets/event_img.png',
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                height: 18.0,
              ),
              Text(
                'Какое-то событие',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 18.0,
              ),
              Text(
                'Пн, 14 Дек. 18.00 - 23.00',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: const Color(0XFF6C63FF), fontSize: 18),
              ),
              const SizedBox(
                height: 24,
              ),
              const Row(
                children: [
                  Icon(LineIcons.mapMarker),
                  SizedBox(
                    width: 4,
                  ),
                  Text('Грозный-Молл, Грозный'),
                ],
              ),
              const SizedBox(
                height: 24,
              )
            ],
          ),
        ),
      ),
    );
  }
}
