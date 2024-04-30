// import 'package:just_audio/just_audio.dart';

import 'package:audioplayers/audioplayers.dart';

class ButtonsSounds {
  // static AudioPlayer sound1 = new AudioPlayer();
  static AudioPlayer audioPlayer = AudioPlayer();
  // static AudioPlayer audioPlayer = AudioPlayer();
  // Función para reproducir el sonido
  static void playSound({String? sound}) async {
    print(
        "--------------------------------------------------------------------------------------------");
    final soundPath = sound ?? "assets/sounds/click_button.mp3";
    print(soundPath);
    try {
      // UrlSource(url)
      // await audioPlayer.setAsset(soundPath);
      audioPlayer.seek(Duration.zero);
      audioPlayer.play(AssetSource(soundPath));
    } catch (e) {
      print(e);
    }
  }
}
