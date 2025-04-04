import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:one/application_constants.dart';
import 'package:one/data/one_card/one_card_enums.dart';

part 'one_card.freezed.dart';
part 'one_card.g.dart';

@freezed
abstract class OneCard with _$OneCard {
  const factory OneCard({
    required String id,
    required String value,
    required CardColor color,
    String? player,
  }) = _OneCard;

  const OneCard._();

  factory OneCard.fromJson(Map<String, Object?> json) =>
      _OneCard.fromJson(json);

  bool get isSpecial =>
      is0 || is7 || isSkip || isDraw2 || isReverse || isColorSelect;

  bool get is0 => value == "0";
  bool get is7 => value == "7";

  bool get isSkip => value == skipCardType;
  bool get isDraw2 => value == draw2CardType;
  bool get isReverse => value == reverseCardType;
  bool get isColorSelect => value == selectCardType || value == draw4CardType;

  bool sameCard(OneCard other) => value == other.value && color == other.color;
}
