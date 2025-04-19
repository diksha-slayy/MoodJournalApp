import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/journal_entry_screen.dart';
import 'package:flutter_application_2/screens/mood_calendar_screen.dart';
import 'mood_log_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Mood Journal'),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.emoji_emotions), text: 'Mood'),
              Tab(icon: Icon(Icons.book), text: 'Journal'),
              Tab(icon: Icon(Icons.calendar_today), text: 'Calendar'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            MoodLogScreen(),
            JournalEntryScreen(),
            MoodCalendarScreen(),
          ],
        ),
      ),
    );
  }
}
