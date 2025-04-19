import 'package:flutter/material.dart';

class MoodCalendarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Placeholder UI
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.calendar_today, size: 60, color: Colors.purple),
          SizedBox(height: 16),
          Text('Mood calendar coming soon...'),
        ],
      ),
    );
  }
}
