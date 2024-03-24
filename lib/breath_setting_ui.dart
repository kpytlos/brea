import 'package:flutter/material.dart';

class BreathSettingUI extends StatefulWidget {
  final Function(int, int, int, int) onSettingsChanged;

  const BreathSettingUI({super.key, required this.onSettingsChanged});

  @override
  BreathSettingUIState createState() => BreathSettingUIState();
}

class BreathSettingUIState extends State<BreathSettingUI> {
  int breatheInDuration = 3;
  int breatheOutDuration = 3;
  int pauseInDuration = 0; // Pause duration after inhaling
  int pauseOutDuration = 0; // Pause duration after exhaling

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text('Breathe In:'),
            DropdownButton<int>(
              value: breatheInDuration,
              onChanged: (newValue) {
                setState(() {
                  breatheInDuration = newValue!;
                  _notifySettingsChanged();
                });
              },
              items: List.generate(99, (index) => index + 1)
                  .map((value) => DropdownMenuItem<int>(
                        value: value,
                        child: Text('$value s'),
                      ))
                  .toList(),
            ),
            const Text('Breathe Out:'),
            DropdownButton<int>(
              value: breatheOutDuration,
              onChanged: (newValue) {
                setState(() {
                  breatheOutDuration = newValue!;
                  _notifySettingsChanged();
                });
              },
              items: List.generate(99, (index) => index + 1)
                  .map((value) => DropdownMenuItem<int>(
                        value: value,
                        child: Text('$value s'),
                      ))
                  .toList(),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text('Pause In:'),
            DropdownButton<int>(
              value: pauseInDuration,
              onChanged: (newValue) {
                setState(() {
                  pauseInDuration = newValue!;
                  _notifySettingsChanged();
                });
              },
              items: List.generate(100, (index) => index)
                  .map((value) => DropdownMenuItem<int>(
                        value: value,
                        child: Text('$value s'),
                      ))
                  .toList(),
            ),
            const Text('Pause Out:'),
            DropdownButton<int>(
              value: pauseOutDuration,
              onChanged: (newValue) {
                setState(() {
                  pauseOutDuration = newValue!;
                  _notifySettingsChanged();
                });
              },
              items: List.generate(100, (index) => index)
                  .map((value) => DropdownMenuItem<int>(
                        value: value,
                        child: Text('$value s'),
                      ))
                  .toList(),
            ),
          ],
        ),
      ],
    );
  }

  void _notifySettingsChanged() {
    widget.onSettingsChanged(breatheInDuration, breatheOutDuration,
        pauseInDuration, pauseOutDuration);
  }
}
