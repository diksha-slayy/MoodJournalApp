import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/journal_entry_screen.dart';
import 'package:flutter_application_2/screens/mood_calendar_screen.dart';
import 'package:flutter_application_2/screens/mood_log_screen.dart';

class TabHomeScreen extends StatefulWidget {
  @override
  _TabHomeScreenState createState() => _TabHomeScreenState();
}

class _TabHomeScreenState extends State<TabHomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    MoodLogScreen(),
    JournalEntryScreen(),
    // QuoteScreen(),
    // MoodSummaryScreen(),
    MoodCalendarScreen(),
  ];

  final List<BottomNavigationBarItem> _items = [
    BottomNavigationBarItem(icon: Icon(Icons.mood), label: 'Mood'),
    BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Journal'),
    BottomNavigationBarItem(icon: Icon(Icons.format_quote), label: 'Quotes'),
    BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Summary'),
    BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'Calendar'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: _items,
      ),
    );
  }
}
