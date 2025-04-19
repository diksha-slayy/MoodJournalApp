import 'package:flutter/material.dart';

class JournalEntryScreen extends StatefulWidget {
  @override
  _JournalEntryScreenState createState() => _JournalEntryScreenState();
}

class _JournalEntryScreenState extends State<JournalEntryScreen> {
  final TextEditingController _controller = TextEditingController();
  String statusMessage = '';

  void saveJournalEntry() {
    String entry = _controller.text.trim();
    if (entry.isNotEmpty) {
      setState(() {
        statusMessage = 'Journal entry saved!';
      });
      _controller.clear();
      // Save logic will be added in Firebase phase
    } else {
      setState(() {
        statusMessage = 'Please write something first.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _controller,
            maxLines: 8,
            decoration: InputDecoration(
              hintText: 'Write about your day...',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: saveJournalEntry,
            child: Text('Save'),
          ),
          SizedBox(height: 8),
          Text(statusMessage),
        ],
      ),
    );
  }
}
