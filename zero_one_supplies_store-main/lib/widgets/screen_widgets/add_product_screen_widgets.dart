import 'package:flutter/material.dart';

class SectionHeaderTextWidget extends StatelessWidget {
  final String text;
  const SectionHeaderTextWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(text,
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(color: Colors.black)),
      ],
    );
  }
}
