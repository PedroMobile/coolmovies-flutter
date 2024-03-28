import 'package:flutter/material.dart';

class GenericErrorWidget extends StatelessWidget {
  final String message;
  final IconData? icon;
  const GenericErrorWidget({super.key, required this.message, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon ?? Icons.error, size: 56),
            const SizedBox(height: 16),
            Text(message, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
