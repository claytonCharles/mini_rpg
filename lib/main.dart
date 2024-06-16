import 'package:bonfire/bonfire.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mini_rpg/src/WorldGame.dart';
import 'package:mini_rpg/src/characters/human_character.dart';
import 'package:mini_rpg/src/utils/sounds_utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb) {
    await Flame.device.setLandscape();
    await Flame.device.fullScreen();
  }
  await SoundsUtils.initialize();
  runApp(const AppMenu());
}

class AppMenu extends StatefulWidget {
  const AppMenu({super.key});

  @override
  State<AppMenu> createState() => _AppMenuState();
}

class _AppMenuState extends State<AppMenu> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WorldGame(character: HumanCharacter(Vector2(16 * 62, 16 * 59)))
    );
  }
}