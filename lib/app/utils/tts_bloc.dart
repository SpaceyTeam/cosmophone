import 'dart:io';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter_tts/flutter_tts.dart';

enum TtsState { playing, stopped }

class TtsBloc extends BlocBase {
  FlutterTts flutterTts;
  dynamic languages;
  dynamic voices;
  String voice;
  String language;
  int silencems;
  TtsState ttsState = TtsState.stopped;
  get isPlaying => ttsState == TtsState.playing;
  get isStopped => ttsState == TtsState.stopped;

  Future _getLanguages() async {
    languages = await flutterTts.getLanguages;
    //if (languages != null) setState(() => languages);
  }

  Future _getVoices() async {
    voices = await flutterTts.getVoices;
    //if (voices != null) setState(() => voices);
  }

  initTts() {
    flutterTts = FlutterTts();

    if (Platform.isAndroid) {
      flutterTts.ttsInitHandler(() {
        _getLanguages();
        _getVoices();
      });
    } else if (Platform.isIOS) {
      _getLanguages();
      _getVoices();
    }

    flutterTts.setStartHandler(() {
      //setState(() {
      ttsState = TtsState.playing;
      //});
    });

    flutterTts.setCompletionHandler(() {
      //setState(() {
      print("Complete");
      ttsState = TtsState.stopped;
      //});
    });

    flutterTts.setErrorHandler((msg) {
      //setState(() {
      ttsState = TtsState.stopped;
      //});
    });

    flutterTts.setLanguage("en-US");
  }

  Future speak(String text) async {
    if (text != null) {
      if (text.isNotEmpty) {
        var result = await flutterTts.speak(text);
        if (result == 1) ttsState = TtsState.playing;
      }
    }
  }

  Future stop() async {
    var result = await flutterTts.stop();
    if (result == 1) ttsState = TtsState.stopped;
  }

  //dispose will be called automatically by closing its streams
  @override
  void dispose() {
    flutterTts.stop();

    super.dispose();
  }
}
