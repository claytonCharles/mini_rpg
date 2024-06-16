import 'package:flame_audio/flame_audio.dart';

class SoundsUtils {
  static Future initialize() async {
    FlameAudio.bgm.initialize();
    await FlameAudio.audioCache.loadAll([
      "musics/bg_music.ogg"
    ]);
  }

  static void playMenuSound() {
    FlameAudio.bgm.play(
      "musics/bg_music.ogg",
      volume: 1
    );
  }

  static void stopMenuSound() {
    FlameAudio.bgm.stop();
  }
}