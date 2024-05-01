// import 'package:just_audio/just_audio.dart';
// import 'package:kplayer/kplayer.dart';
// import 'package:simple_audio/simple_audio.dart';
// import 'package:audio_in_app/audio_in_app.dart';

// ...
// void sss() async {
//   final engine = minisound.Engine();
//   await engine.init();
//   final sound = await engine.loadSoundAsset("asset/path.ext");
//   sound.volume = 0.5;
//   await engine.start();
//   sound.play();
// }

import 'dart:io';

Future<void> reproducirAudio(String rutaAudio) async {
  try {
    // Llama al script de shell y proporciona la ruta del archivo de audio como argumento
    ProcessResult result = await Process.run(
        '/home/modularbox/github/safey/assets/script/play.sh', [rutaAudio]);

    // Verifica si el proceso se ejecutó exitosamente
    if (result.exitCode == 0) {
      print('El audio se reprodujo correctamente.');
    } else {
      print('Hubo un error al reproducir el audio: ${result.stderr}');
    }
  } catch (e) {
    print('Error al ejecutar el script: $e');
  }
}

Future<void> reproducirTextoAudio(String rutaAudio) async {
  try {
    // Llama al script de shell y proporciona la ruta del archivo de audio como argumento
    ProcessResult result = await Process.run(
        '/home/modularbox/github/safey/assets/script/play_text.sh',
        [rutaAudio]);

    // Verifica si el proceso se ejecutó exitosamente
    if (result.exitCode == 0) {
      print('El audio se reprodujo correctamente.');
    } else {
      print('Hubo un error al reproducir el audio: ${result.stderr}');
    }
  } catch (e) {
    print('Error al ejecutar el script: $e');
  }
}

class ButtonsSounds {
  // static AudioPlayer sound1 = new AudioPlayer();
  // static AudioPlayer audioPlayer = AudioPlayer();
  // static AudioInApp _audioInApp = AudioInApp();
  // Función para reproducir el sonido
  static void playSound({String? sound}) async {
    print(
        "--------------------------------------------------------------------------------------------");
    final soundPath = sound ?? "assets/sounds/click_button.mp3";
    print(soundPath);
    try {
      await reproducirAudio('/home/modularbox/github/safey/$soundPath');
// final player = AudioPlayer();
      // await audioPlayer.play(AssetSource(soundPath));
      // await _audioInApp.createNewAudioCache(
      //     playerId: 'button',
      //     route:
      //         'https://commondatastorage.googleapis.com/codeskulptor-assets/Collision8-Bit.ogg',
      //     audioInAppType: AudioInAppType.background);
      // await _audioInApp.play(playerId: 'button');
      // var player = Player.asset(soundPath);
      // player.play();
      // SimpleAudio _audioPlayer;
      // bool _isPlaying = false;

      // _audioPlayer = SimpleAudio();
      // _audioPlayer.open(soundPath);
      // _audioPlayer.play();

      // final engine = minisound.Engine();
      // await engine.init();
      // final sound = await engine.loadSoundAsset(soundPath);
      // sound.volume = 0.5;
      // await engine.start();
      // sound.play();
      // await audioPlayer.setAsset(soundPath);
      // audioPlayer.seek(Duration.zero);
      // audioPlayer.play();
    } catch (e) {
      print(e);
    }
  }
}
