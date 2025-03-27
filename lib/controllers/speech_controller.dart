import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeechController extends ChangeNotifier {
  // Declare varibles
  SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _lastWords = '';

  // Create a getters method
  bool get speechEnabled => _speechEnabled;
  String get lastWords => _lastWords;
  bool get isListening => _speechToText.isListening;

  //  // Initialize speech recognition
  SpeechController() {
    _initSpeech();
  }

  // Init method
  Future<void> _initSpeech() async {
    try {
      _speechEnabled = await _speechToText.initialize();
    } catch (e) {
      print("Error initializing SpeechToText: $e");
    }
    notifyListeners(); // Ensure UI updates after initialization
  }

  // Start Methid
  void startListening() async {
    await _speechToText.listen(onResult: (result) {
      _lastWords = result.recognizedWords;
      notifyListeners();
    });
  }

  // Stop Method
  void stopListening() async {
    await _speechToText.stop();
    notifyListeners();
  }
}
