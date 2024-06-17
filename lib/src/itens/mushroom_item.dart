import 'package:bonfire/bonfire.dart';

class MushroomItem extends GameComponent {
  MushroomItem({required this.icon});
  String name = "Mushroom";
  String type = "item";
  String description = "Heal life in 100 points";
  Sprite icon;
  
  void onUse(BonfireGameInterface refGame) {
    refGame.player!.addLife(100.0);
  }
}