import 'package:flutter/material.dart';
import 'package:speech_recognition/speech_recognition.dart';

class SpeechRecScreen extends StatefulWidget {
  @override
  _SpeechRecScreenState createState() => _SpeechRecScreenState();
}

class _SpeechRecScreenState extends State<SpeechRecScreen> {
  var _speech = SpeechRecognition();

  bool _speechRecognitionAvailable;
  bool _isListening;
  String transcription;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _speech.setAvailabilityHandler(
        (bool result) => setState(() => _speechRecognitionAvailable = result));

    _speech.setRecognitionStartedHandler(
        () => setState(() => _isListening = true));

    _speech.setRecognitionResultHandler(
        (String text) => setState(() => transcription = text));

    _speech.setRecognitionCompleteHandler(
        () => setState(() => _isListening = false));

    _speech
        .activate()
        .then((res) => setState(() => _speechRecognitionAvailable = res));
    _speech.listen(locale: "Ru").then((result) => print('result : $result'));
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
