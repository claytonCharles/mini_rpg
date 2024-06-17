import 'package:bonfire/bonfire.dart';
import 'package:mini_rpg/src/decorations/chest_decoration.dart';
import 'package:mini_rpg/src/decorations/mushroom_decoration.dart';
import 'package:mini_rpg/src/mobs/devil_mob.dart';

class InitialMap {
  WorldMapByTiled initWorld() {
    return WorldMapByTiled(
      WorldMapReader.fromAsset("maps/tundra_map.json"),
      objectsBuilder: {
        "devil": (props) => DevilMob(initPosition: props.position),
        "chest": (props) => ChestDecoration(props.position),
        "mushroom": (props) => MushroomDecoration(initPosition: props.position),
      },
    );
  }
}