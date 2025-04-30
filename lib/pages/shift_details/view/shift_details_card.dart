import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ShiftDetailsCard extends StatelessWidget {
  const ShiftDetailsCard({
    required this.title,
    required this.pitchName,
    required this.date,
    super.key,
  });

  final String title;
  final String pitchName;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Theme.of(context).colorScheme.onSurface,
    );
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: style),
                Text(pitchName, style: style),
              ],
            ),
            const SizedBox(height: 8),
            // TODO(any): Add translation
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Date ${DateFormat('dd/MM/yy').format(date)}',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
                Text(
                  'Time ${DateFormat('HH:mm').format(date)}',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
