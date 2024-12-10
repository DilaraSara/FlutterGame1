import 'package:flutter/material.dart';

class SoundSettingsPage extends StatefulWidget {
  @override
  _SoundSettingsPageState createState() => _SoundSettingsPageState();
}

class _SoundSettingsPageState extends State<SoundSettingsPage> {
  double _soundLevel = 0.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sound Settings'),
      ),
      body: Container(
        color: Colors.yellow,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '🐱',
                style: TextStyle(fontSize: 40),
              ),
              SizedBox(height: 20),
              Text(
                'Sound Level: ${(_soundLevel * 100).round()}%',
                style: TextStyle(fontSize: 20),
              ),
              Slider(
                value: _soundLevel,
                onChanged: (newValue) {
                  setState(() {
                    _soundLevel = newValue;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
