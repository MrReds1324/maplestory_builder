import 'package:maplestory_builder/constants/equipment/flame_stats.dart';
import 'package:maplestory_builder/constants/equipment/potential_stats.dart';
import 'package:maplestory_builder/constants/equipment/scroll_stats.dart';
import 'package:test/test.dart';

void main() {
  test("Test that all FlameName's pass validation", () {
    for (FlameName flameName in FlameName.values) {
      expect(() => flameName.validate(), returnsNormally);
    }
  });

  test("Test that all ScrollNames's create Scroll Objects appropriately", () {
    for (ScrollName scrollName in ScrollName.values) {
      expect(scrollName.createScrollObject, returnsNormally);
    }
  });

  test("Test that all PotentialName's pass validation", () {
    for (PotentialName potentialName in PotentialName.values) {
      expect(() => potentialName.validate(), returnsNormally);
    }
  });

}
