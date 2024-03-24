import 'package:flutter/material.dart';
import 'circle_animation.dart';
import 'breath_setting_ui.dart';

class BreathingScreen extends StatefulWidget {
  const BreathingScreen({super.key});

  @override
  BreathingScreenState createState() => BreathingScreenState();
}

class BreathingScreenState extends State<BreathingScreen> {
  int breatheInDuration = 3;
  int breatheOutDuration = 3;
  int pauseInDuration = 0;
  int pauseOutDuration = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Breath Bond'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: CircleAnimation(
                breatheInDuration: breatheInDuration,
                breatheOutDuration: breatheOutDuration,
                pauseInDuration: pauseInDuration,
                pauseOutDuration: pauseOutDuration,
              ),
            ),
          ),
          BreathSettingUI(
            onSettingsChanged:
                (int inDuration, int outDuration, int pauseIn, int pauseOut) {
              setState(() {
                breatheInDuration = inDuration;
                breatheOutDuration = outDuration;
                pauseInDuration = pauseIn;
                pauseOutDuration = pauseOut;
              });
            },
          ),
        ],
      ),
    );
  }
}
