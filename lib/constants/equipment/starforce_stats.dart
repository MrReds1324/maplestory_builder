
// ignore_for_file: constant_identifier_names

// Gives us the index into the bonus stats tables
import 'package:maplestory_builder/constants/constants.dart';

enum StarForceCategory {
  none, // Used for equipment the player is unable to star force at all
  player, // Used for equipment the player is able to modify
  static, // Used for equipment that has static/unmodifiable starforce
}

const INDEX_128 = 0; // 128-137
const INDEX_138 = 1; // 138-149
const INDEX_150 = 2; // 150-159
const INDEX_160 = 3; // 160-199
const INDEX_200 = 4; // 200-249
const INDEX_250 = 5; // 250+

// This tracks the per level bonus stats for starforce over 15 stars, this will be added to the bonus 40 stats from 15 stars
const starForceStats = {
  16: [7, 9, 11, 13, 15, 17],
  17: [14, 18, 22, 26, 30, 34],
  18: [21, 27, 33, 39, 45, 51],
  19: [28, 36, 44, 52, 60, 68],
  20: [35, 45, 55, 65, 75, 85],
  21: [35, 54, 66, 78, 90, 102],
  22: [35, 63, 77, 91, 105, 119],
  23: [35, 63, 77, 91, 105, 119],
  24: [35, 63, 77, 91, 105, 119],
  25: [35, 63, 77, 91, 105, 119],
};
// This tracks the per star bonus att and magic att for starforce over 15 stars for non weapon equips
const starForceNonWepAtt = {
  16: [7, 8, 9, 10, 12, 14],
  17: [15, 17, 19, 21, 25, 29],
  18: [24, 27, 30, 33, 39, 45],
  19: [34, 38, 42, 46, 54, 62],
  20: [45, 50, 55, 60, 70, 80],
  21: [45, 63, 69, 75, 87, 99],
  22: [45, 78, 85, 92, 106, 120],
  23: [45, 95, 103, 111, 127, 143],
  24: [45, 114, 123, 132, 150, 168],
  25: [45, 135, 145, 155, 175, 195],
};
// This tracks the per star bonus att and magic att for starforce over 15 stars for weapon equips
const starForceWepAtt = {
  16: [6, 7, 8, 9, 13, 0],
  17: [13, 15, 17, 18, 26, 0],
  18: [20, 23, 26, 28, 40, 0],
  19: [28, 32, 36, 39, 54, 0],
  20: [37, 42, 47, 51, 69, 0],
  21: [37, 53, 59, 64, 85, 0],
  22: [37, 65, 72, 78, 102, 0],
  23: [37, 95, 103, 110, 136, 0],
  24: [37, 126, 135, 143, 171, 0],
  25: [37, 158, 168, 177, 207, 0],
};

// Category A items: Items that will increase Max HP.
// Hat
// Top
// Bottom
// Overall
// Cape
// Ring
// Pendant
// Belt
// Shoulderpad
// Shield
// Weapon (including Kataras)

const hpCategory = <EquipType>[
  EquipType.hat, EquipType.top, EquipType.bottom, EquipType.overall, EquipType.cape, EquipType.ring, EquipType.pendant, 
  EquipType.belt, EquipType.shoulder, EquipType.shield, EquipType.weapon, EquipType.katara,
];