import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TextSection extends StatelessWidget {
  final String description;

  const TextSection({
    super.key,
    required this.description
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(32),
          child: Text(
            description,
            softWrap: true,
          ),
        ),
        ElevatedButton(
          onPressed: () {
            context.goNamed('login');
          },
          child: const Text('Go to login page'),
        )
      ],
    );
  }
}