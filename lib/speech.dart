import 'package:flutter/material.dart';
import 'package:mobile_app/create.dart';
import 'package:speech_recognition/speech_recognition.dart';

class SpeechRecScreen extends StatefulWidget {
  @override
  _SpeechRecScreenState createState() => _SpeechRecScreenState();
}

class _SpeechRecScreenState extends State<SpeechRecScreen> {
  var _speech = SpeechRecognition();

  bool _speechRecognitionAvailable;
  bool _isListening;
  String transcription = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _speech.setAvailabilityHandler(
        (bool result) => setState(() => _speechRecognitionAvailable = result));

    _speech.setRecognitionStartedHandler(
        () => setState(() => _isListening = true));

    _speech.setRecognitionResultHandler((String text) => setState(() {
          transcription = text;
          if (transcription.length > 1)
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => CreateScreen(
                  id: 0,
                ),
              ),
            );
        }));

    _speech.setRecognitionCompleteHandler(
        () => setState(() => _isListening = false));
    _speech.listen(locale: "ru_RU").then(
      (result) {
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(transcription),
      ),
    );
  }
}
