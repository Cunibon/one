// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'one_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OneCard _$OneCardFromJson(Map<String, dynamic> json) => _OneCard(
  value: json['value'] as String,
  color: $enumDecode(_$CardColorEnumMap, json['color']),
);

Map<String, dynamic> _$OneCardToJson(_OneCard instance) => <String, dynamic>{
  'value': instance.value,
  'color': _$CardColorEnumMap[instance.color]!,
};

const _$CardColorEnumMap = {
  CardColor.blank: 'blank',
  CardColor.red: 'red',
  CardColor.green: 'green',
  CardColor.blue: 'blue',
  CardColor.yellow: 'yellow',
};
