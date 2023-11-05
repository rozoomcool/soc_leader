import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton({super.key, required this.title, this.isPrime = false});

  final String title;
  final bool isPrime;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: isPrime
            ? FilledButton(
                onPressed: () {},
                child: Text(
                  "Все",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: const Color(0XFFFAFAFA)),
                ))
            : OutlinedButton(
                onPressed: () {},
                child: Text(title,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge)));
  }
}
