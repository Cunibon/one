// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GameState _$GameStateFromJson(Map<String, dynamic> json) => _GameState(
  lastPlayed: OneCard.fromJson(json['lastPlayed'] as Map<String, dynamic>),
  playerCards: Map<String, int>.from(json['playerCards'] as Map),
  myHand:
      (json['myHand'] as List<dynamic>)
          .map((e) => OneCard.fromJson(e as Map<String, dynamic>))
          .toList(),
  clockwise: json['clockwise'] as bool,
);

Map<String, dynamic> _$GameStateToJson(_GameState instance) =>
    <String, dynamic>{
      'lastPlayed': instance.lastPlayed,
      'playerCards': instance.playerCards,
      'myHand': instance.myHand,
      'clockwise': instance.clockwise,
    };
