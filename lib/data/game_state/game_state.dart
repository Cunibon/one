import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:one/data/one_card/one_card.dart';

part 'game_state.freezed.dart';
part 'game_state.g.dart';

@freezed
abstract class GameState with _$GameState {
  const factory GameState({
    required OneCard lastPlayed,
    required Map<String, int> playerCards,
    required List<OneCard> myHand,
    required String currentPlayer,
    required bool clockwise,
  }) = _GameState;

  factory GameState.fromJson(Map<String, Object?> json) =>
      _GameState.fromJson(json);
}
