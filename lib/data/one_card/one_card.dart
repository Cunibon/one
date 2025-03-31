import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:one/data/one_card/one_card_enums.dart';

part 'one_card.freezed.dart';
part 'one_card.g.dart';

@freezed
abstract class OneCard with _$OneCard {
  const factory OneCard({required String value, required CardColor color}) =
      _OneCard;

  factory OneCard.fromJson(Map<String, Object?> json) =>
      _OneCard.fromJson(json);
}
