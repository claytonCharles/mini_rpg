import 'package:bonfire/bonfire.dart';
import 'package:mini_rpg/src/mobs/devil_mob.dart';

class InitialMap {
  WorldMapByTiled initWorld() {
    return WorldMapByTiled(
      WorldMapReader.fromAsset("maps/tundra_map.json"),
      objectsBuilder: {
        "devil": (props) => DevilMob(initPosition: props.position)
      },
      
    );
  }
}