import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PinLockScreen extends StatefulWidget {
  final VoidCallback onUnlocked;
  const PinLockScreen({required this.onUnlocked});

  @override
  State<PinLockScreen> createState() => _PinLockScreenState();
}

class _PinLockScreenState extends State<PinLockScreen> {
  final TextEditingController _pinController = TextEditingController();
  String? _savedPin;
  String message = '';

  @override
  void initState() {
    super.initState();
    loadSavedPin();
  }

  Future<void> loadSavedPin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _savedPin = prefs.getString('user_pin');
    });
  }

  Future<void> savePin(String pin) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_pin', pin);
    setState(() {
      _savedPin = pin;
    });
  }

  void handleSubmit() async {
    String enteredPin = _pinController.text;
    if (enteredPin.length != 4) {
      setState(() => message = 'Please enter a 4-digit PIN.');
      return;
    }

    if (_savedPin == null) {
      // First-time setup
      await savePin(enteredPin);
      widget.onUnlocked();
    } else {
      if (enteredPin == _savedPin) {
        widget.onUnlocked();
      } else {
        setState(() => message = 'Incorrect PIN. Try again.');
      }
    }

    _pinController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.lock, size: 60, color: Colors.purple),
              SizedBox(height: 16),
              Text(
                _savedPin == null ? 'Set Your PIN' : 'Enter PIN to Unlock',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _pinController,
                keyboardType: TextInputType.number,
                obscureText: true,
                maxLength: 4,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'PIN',
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: handleSubmit,
                child: Text(_savedPin == null ? 'Set PIN' : 'Unlock'),
              ),
              SizedBox(height: 12),
              Text(message, style: TextStyle(color: Colors.red)),
            ],
          ),
        ),
      ),
    );
  }
}
