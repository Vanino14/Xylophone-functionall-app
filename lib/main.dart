import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  Widget note() {
    List<Widget> buttons = [];
    List<Color> colors = [
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.yellow,
      Colors.purple,
      Colors.orange,
      Colors.teal
    ];
    for (int i = 1; i < 8; i++) {
      buttons.add(
        Expanded(
          child: Container(
            color: colors[i - 1],
            child: TextButton(
              onPressed: () {
                final player = AudioPlayer();
                // Pastikan path asset sudah diatur di pubspec.yaml
                player.play(AssetSource('assets/note$i.wav')); // Menggunakan 'note$i.wav' jika ingin mengakses note1, note2, dst.
                print('Button $i pressed');
              },
              child:Text(''),
            ),
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: buttons,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: note()
        ),
      ),
    );
  }
}
