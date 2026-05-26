import 'package:flutter/material.dart';

class AddWorkoutButton extends StatelessWidget {
  const AddWorkoutButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      child: const Text('+ Add Workout'),
    );
  }
}
