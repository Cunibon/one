// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'one_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OneCard _$OneCardFromJson(Map<String, dynamic> json) => _OneCard(
  value: json['value'] as String,
  color: $enumDecode(_$CardColorEnumMap, json['color']),
  player: json['player'] as String?,
);

Map<String, dynamic> _$OneCardToJson(_OneCard instance) => <String, dynamic>{
  'value': instance.value,
  'color': _$CardColorEnumMap[instance.color]!,
  'player': instance.player,
};

const _$CardColorEnumMap = {
  CardColor.blank: 'blank',
  CardColor.red: 'red',
  CardColor.green: 'green',
  CardColor.blue: 'blue',
  CardColor.yellow: 'yellow',
};
