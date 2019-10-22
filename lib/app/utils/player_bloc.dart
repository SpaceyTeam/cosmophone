import 'package:audioplayers/audio_cache.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:audioplayers/audioplayers.dart';

class PlayerBloc extends BlocBase {
  var audioPlayers = List<AudioPlayer>();
  var audioCaches = List<AudioCache>();

  void start() {
    for (var i = 0; i < 11; i++) {
      var audioPlayer = AudioPlayer();
      audioPlayers.add(audioPlayer);
      audioCaches.add(AudioCache(fixedPlayer: audioPlayer));
    }

    audioCaches[0].loop('Xilofone.mp3', volume: 0.02);
    audioCaches[1].loop('Flauta.mp3', volume: 0.02);
    audioCaches[2].loop('Violino.mp3', volume: 0.02);
    audioCaches[3].loop('Violoncelo.mp3', volume: 0.02);
    audioCaches[4].loop('Baixo.mp3', volume: 0.02);
    audioCaches[5].loop('Marimba.mp3', volume: 0.02);
    audioCaches[6].loop('Piano.mp3', volume: 0.02);
    audioCaches[7].loop('Coral.mp3', volume: 0.02);
    audioCaches[8].loop('Caixa.mp3', volume: 0.02);
    audioCaches[9].loop('Timpano.mp3', volume: 0.02);
    audioCaches[10].loop('Timpano.mp3', volume: 0.02);
  }

  void setVolume(int index, double volume) {
    audioCaches[index].fixedPlayer.setVolume(volume);
  }

  void setAllMinimalVolume() {
    for (var i = 0; i < 11; i++) {
      audioCaches[i].fixedPlayer.setVolume(0.05);
    }
  }

  //dispose will be called automatically by closing its streams
  @override
  void dispose() {
    for (var i = 0; i < 11; i++) {
      audioPlayers[i].stop();
      audioPlayers[i].dispose();
    }

    super.dispose();
  }
}
