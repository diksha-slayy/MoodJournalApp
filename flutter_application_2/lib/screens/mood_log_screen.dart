import 'package:flutter/material.dart';

class MoodLogScreen extends StatefulWidget {
  @override
  _MoodLogScreenState createState() => _MoodLogScreenState();
}

class _MoodLogScreenState extends State<MoodLogScreen> {
  String? selectedMood;
  TextEditingController noteController = TextEditingController();

  List<Map<String, dynamic>> moodLogs = [];

  final List<Map<String, dynamic>> moodOptions = [
    {'emoji': '😄', 'label': 'Happy'},
    {'emoji': '😢', 'label': 'Sad'},
    {'emoji': '😡', 'label': 'Angry'},
    {'emoji': '😰', 'label': 'Anxious'},
    {'emoji': '😴', 'label': 'Tired'},
  ];

  void saveMood() {
    if (selectedMood != null) {
      setState(() {
        moodLogs.add({
          'mood': selectedMood,
          'note': noteController.text.trim(),
          'time': DateTime.now()
        });
        selectedMood = null;
        noteController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log Your Mood'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('How are you feeling today?',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Wrap(
              spacing: 12,
              children: moodOptions.map((mood) {
                return ChoiceChip(
                  label: Text(mood['emoji']),
                  selected: selectedMood == mood['label'],
                  onSelected: (_) {
                    setState(() => selectedMood = mood['label']);
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            TextField(
              controller: noteController,
              decoration: InputDecoration(
                labelText: 'Optional note...',
                border: OutlineInputBorder(),
              ),
              maxLines: 2,
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: saveMood,
              child: Text('Save Mood'),
            ),
            SizedBox(height: 20),
            Divider(),
            Text('Mood Log History',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Expanded(
              child: moodLogs.isEmpty
                  ? Center(child: Text('No moods logged yet.'))
                  : ListView.builder(
                      itemCount: moodLogs.length,
                      itemBuilder: (context, index) {
                        final mood = moodLogs[index];
                        return ListTile(
                          leading: Text(
                            moodOptions
                                .firstWhere((e) => e['label'] == mood['mood'])[
                                    'emoji']
                                .toString(),
                            style: TextStyle(fontSize: 24),
                          ),
                          title: Text(mood['mood']),
                          subtitle: Text(
                            mood['note'].isEmpty
                                ? 'No note'
                                : mood['note'],
                          ),
                          trailing: Text(
                            '${mood['time'].hour}:${mood['time'].minute.toString().padLeft(2, '0')}',
                          ),
                        );
                      },
                    ),
            )
          ],
        ),
      ),
    );
  }
}
