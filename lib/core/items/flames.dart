class Flame {
  FlameLine flameLine1 = FlameLine();
  FlameLine flameLine2 = FlameLine();
  FlameLine flameLine3 = FlameLine();
  FlameLine flameLine4 = FlameLine();

  Flame.oneLine({
    required this.flameLine1
  });

  Flame.twoLine({
    required this.flameLine1,
    required this.flameLine2,
  });

  Flame.threeLine({
    required this.flameLine1,
    required this.flameLine2,
    required this.flameLine3,
  });

  Flame.fourLine({
    required this.flameLine1,
    required this.flameLine2,
    required this.flameLine3,
    required this.flameLine4,
  });
}

class FlameLine {
  
}