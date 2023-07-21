import 'package:intl/intl.dart';

final doubleRoundPercentFormater = NumberFormat('#####%');
final doubleRoundFormater = NumberFormat('#######');
final doublePercentFormater = NumberFormat('####.00%');
final rangeFormatter = NumberFormat('###,###,###,###,###');

String formatCharacterClassEnumName(String nameValue) {
  return nameValue.replaceAll('_', nameValue);
}