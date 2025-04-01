// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GameState {

 OneCard get lastPlayed; Map<String, int> get playerCards; List<OneCard> get myHand; bool get clockwise;
/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GameStateCopyWith<GameState> get copyWith => _$GameStateCopyWithImpl<GameState>(this as GameState, _$identity);

  /// Serializes this GameState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameState&&(identical(other.lastPlayed, lastPlayed) || other.lastPlayed == lastPlayed)&&const DeepCollectionEquality().equals(other.playerCards, playerCards)&&const DeepCollectionEquality().equals(other.myHand, myHand)&&(identical(other.clockwise, clockwise) || other.clockwise == clockwise));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lastPlayed,const DeepCollectionEquality().hash(playerCards),const DeepCollectionEquality().hash(myHand),clockwise);

@override
String toString() {
  return 'GameState(lastPlayed: $lastPlayed, playerCards: $playerCards, myHand: $myHand, clockwise: $clockwise)';
}


}

/// @nodoc
abstract mixin class $GameStateCopyWith<$Res>  {
  factory $GameStateCopyWith(GameState value, $Res Function(GameState) _then) = _$GameStateCopyWithImpl;
@useResult
$Res call({
 OneCard lastPlayed, Map<String, int> playerCards, List<OneCard> myHand, bool clockwise
});


$OneCardCopyWith<$Res> get lastPlayed;

}
/// @nodoc
class _$GameStateCopyWithImpl<$Res>
    implements $GameStateCopyWith<$Res> {
  _$GameStateCopyWithImpl(this._self, this._then);

  final GameState _self;
  final $Res Function(GameState) _then;

/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lastPlayed = null,Object? playerCards = null,Object? myHand = null,Object? clockwise = null,}) {
  return _then(_self.copyWith(
lastPlayed: null == lastPlayed ? _self.lastPlayed : lastPlayed // ignore: cast_nullable_to_non_nullable
as OneCard,playerCards: null == playerCards ? _self.playerCards : playerCards // ignore: cast_nullable_to_non_nullable
as Map<String, int>,myHand: null == myHand ? _self.myHand : myHand // ignore: cast_nullable_to_non_nullable
as List<OneCard>,clockwise: null == clockwise ? _self.clockwise : clockwise // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OneCardCopyWith<$Res> get lastPlayed {
  
  return $OneCardCopyWith<$Res>(_self.lastPlayed, (value) {
    return _then(_self.copyWith(lastPlayed: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _GameState implements GameState {
  const _GameState({required this.lastPlayed, required final  Map<String, int> playerCards, required final  List<OneCard> myHand, required this.clockwise}): _playerCards = playerCards,_myHand = myHand;
  factory _GameState.fromJson(Map<String, dynamic> json) => _$GameStateFromJson(json);

@override final  OneCard lastPlayed;
 final  Map<String, int> _playerCards;
@override Map<String, int> get playerCards {
  if (_playerCards is EqualUnmodifiableMapView) return _playerCards;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_playerCards);
}

 final  List<OneCard> _myHand;
@override List<OneCard> get myHand {
  if (_myHand is EqualUnmodifiableListView) return _myHand;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_myHand);
}

@override final  bool clockwise;

/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GameStateCopyWith<_GameState> get copyWith => __$GameStateCopyWithImpl<_GameState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GameStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GameState&&(identical(other.lastPlayed, lastPlayed) || other.lastPlayed == lastPlayed)&&const DeepCollectionEquality().equals(other._playerCards, _playerCards)&&const DeepCollectionEquality().equals(other._myHand, _myHand)&&(identical(other.clockwise, clockwise) || other.clockwise == clockwise));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lastPlayed,const DeepCollectionEquality().hash(_playerCards),const DeepCollectionEquality().hash(_myHand),clockwise);

@override
String toString() {
  return 'GameState(lastPlayed: $lastPlayed, playerCards: $playerCards, myHand: $myHand, clockwise: $clockwise)';
}


}

/// @nodoc
abstract mixin class _$GameStateCopyWith<$Res> implements $GameStateCopyWith<$Res> {
  factory _$GameStateCopyWith(_GameState value, $Res Function(_GameState) _then) = __$GameStateCopyWithImpl;
@override @useResult
$Res call({
 OneCard lastPlayed, Map<String, int> playerCards, List<OneCard> myHand, bool clockwise
});


@override $OneCardCopyWith<$Res> get lastPlayed;

}
/// @nodoc
class __$GameStateCopyWithImpl<$Res>
    implements _$GameStateCopyWith<$Res> {
  __$GameStateCopyWithImpl(this._self, this._then);

  final _GameState _self;
  final $Res Function(_GameState) _then;

/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lastPlayed = null,Object? playerCards = null,Object? myHand = null,Object? clockwise = null,}) {
  return _then(_GameState(
lastPlayed: null == lastPlayed ? _self.lastPlayed : lastPlayed // ignore: cast_nullable_to_non_nullable
as OneCard,playerCards: null == playerCards ? _self._playerCards : playerCards // ignore: cast_nullable_to_non_nullable
as Map<String, int>,myHand: null == myHand ? _self._myHand : myHand // ignore: cast_nullable_to_non_nullable
as List<OneCard>,clockwise: null == clockwise ? _self.clockwise : clockwise // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OneCardCopyWith<$Res> get lastPlayed {
  
  return $OneCardCopyWith<$Res>(_self.lastPlayed, (value) {
    return _then(_self.copyWith(lastPlayed: value));
  });
}
}

// dart format on
