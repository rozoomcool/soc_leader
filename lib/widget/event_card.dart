import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class EventCard extends StatelessWidget {
  const EventCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 20)],
          borderRadius: BorderRadius.circular(23)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/1234.jpg',
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              'Какое-то событие',
              maxLines: 2,
              overflow: TextOverflow.clip,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge?.copyWith(fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 4.0,
            ),
            Text(
              'Пн, 14 Дек. 18.00 - 23.00',
              maxLines: 2,
              overflow: TextOverflow.clip,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: const Color(0XFF6C63FF), fontSize: 12),
            ),
            const SizedBox(
              height: 4.0,
            ),
            RichText(text: TextSpan(children: [
              const WidgetSpan(child: Icon(LineIcons.mapMarker, size: 16,)),
              const WidgetSpan(child: SizedBox(width: 4.0,)),
              TextSpan(text: "Грозный-Молл, Грозный", style: Theme.of(context).textTheme.labelSmall),
            ])),
            const SizedBox(
              height: 2.0,
            )
          ],
        ),
      ),
    );
  }

}