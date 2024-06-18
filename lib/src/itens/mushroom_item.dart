import 'package:bonfire/bonfire.dart';

class MushroomItem {
  MushroomItem({required this.icon});
  String name = "Mushroom";
  String type = "item";
  String description = "Heal life in 100 points";
  Sprite icon;
  int quantity = 1;
  
  void onUse(BonfireGameInterface refGame) {
    refGame.player!.addLife(100.0);
  }
}