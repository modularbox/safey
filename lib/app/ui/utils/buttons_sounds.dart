// import 'package:just_audio/just_audio.dart';
import 'package:simple_audio/simple_audio.dart';

// ...
// void sss() async {
//   final engine = minisound.Engine();
//   await engine.init();
//   final sound = await engine.loadSoundAsset("asset/path.ext");
//   sound.volume = 0.5;
//   await engine.start();
//   sound.play();
// }

class ButtonsSounds {
  // static AudioPlayer sound1 = new AudioPlayer();
  // static AudioPlayer audioPlayer = AudioPlayer();
  // Función para reproducir el sonido
  static void playSound({String? sound}) async {
    print(
        "--------------------------------------------------------------------------------------------");
    final soundPath = sound ?? "assets/sounds/click_button.mp3";
    print(soundPath);
    try {
// final player = AudioPlayer();
      // await audioPlayer.play(AssetSource(soundPath));

      SimpleAudio _audioPlayer;
      bool _isPlaying = false;

      _audioPlayer = SimpleAudio();
      _audioPlayer.open(soundPath);
      _audioPlayer.play();

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
