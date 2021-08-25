import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:highlight_text/highlight_text.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:flutter_tts/flutter_tts.dart';
import 'package:vision_aid/main.dart';
import 'ui/home_view.dart';
import 'letter_rec.dart';
import 'settings.dart';
import 'home.dart';

import 'reference.dart';
import 'package:audioplayers/audioplayers.dart';


class SpeechRecognitionPage extends StatefulWidget {
  SpeechRecognitionPage({Key key,  this.title}) : super(key: key);
  final String title;
  @override
  _SpeechRecognitionPageState createState() => _SpeechRecognitionPageState();
}



enum TtsState { playing, stopped, paused, continued }
const listeningPath = "listening.mp3";

class _SpeechRecognitionPageState extends State<SpeechRecognitionPage> {


  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) => setState(() {
            _text = val.recognizedWords;
            print(_text);
            if (val.hasConfidenceRating && val.confidence > 0) {
              _confidence = val.confidence;
            }
            if (_text == "open object detector" || _text == "open object recognition" || _text == "object detection" || _text == "object recognizer" ||_text == "detect objects"|| _text == "recognize objects"){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage(cameras))
              );
            }
            if (_text == "open letter recognition"){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LetterRecognitionPage(title: "Letter Recognition"))
              );
            }
            if (_text == "open settings"){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingPage(title: "Settings"))
              );
            }
            if (_text == "Mute??"){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LetterRecognitionPage(title: "Letter Recognition"))
              );
            }
          }),
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }



  @override
  void initState() {
    super.initState();

    stt.SpeechToText _speech = stt.SpeechToText();
    _speech = stt.SpeechToText();
    _listen();
  }

  static AudioCache player = new AudioCache();
  FlutterTts tts = FlutterTts();
  var speech_input = "HELLO FOOLS!";

  SpeechRecognitionPage(){
    tts.setLanguage('en');
    tts.setSpeechRate(0.25);
  }

  Map<String, HighlightedWord> words = {
    'Object Detector': HighlightedWord(
      onTap: () {
        print('Object Detector');
      },
      textStyle:  TextStyle(
        color: Colors.blueAccent,
        fontWeight: FontWeight.bold,
      ),
    ),
    'Object Recognition': HighlightedWord(
      onTap: () {
        print('Object Recognition');
      },
      textStyle: TextStyle(
        color: Colors.blueAccent,
        fontWeight: FontWeight.bold,
      ),
    ),
    'Text Recognition': HighlightedWord(
      onTap: () {
        print('Text Recognition');
      },
      textStyle: TextStyle(
        color: Colors.indigoAccent,
        fontWeight: FontWeight.bold,
      ),
    ),
    'Letter Recognition': HighlightedWord(
      onTap: () {
        print('Letter Recognition');
      },
      textStyle: TextStyle(
        color: Colors.indigoAccent,
        fontWeight: FontWeight.bold,
      ),
    ),
    'Settings': HighlightedWord(
      onTap: () {
        print('Settings');
      },
      textStyle:  TextStyle(
        color: Colors.deepPurpleAccent,
        fontWeight: FontWeight.bold,
      ),
    ),
  };

  stt.SpeechToText _speech = stt.SpeechToText();
  bool _isListening = false;
  String _text = 'Press the button and start speaking';
  double _confidence = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confidence: ${(_confidence * 100.0).toStringAsFixed(1)}%'),
      ),

      //

      body: SingleChildScrollView(
        reverse: true,
        child: Container(
          padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 150.0),
          child: TextHighlight(
            text: _text,
            words: words,
            textStyle:  TextStyle(
              fontSize: 32.0,
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }

  void playAudio() {
    player.play(listeningPath);
  }

}