// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'one_card.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OneCard {

 String get value; CardColor get color; String? get player;
/// Create a copy of OneCard
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OneCardCopyWith<OneCard> get copyWith => _$OneCardCopyWithImpl<OneCard>(this as OneCard, _$identity);

  /// Serializes this OneCard to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OneCard&&(identical(other.value, value) || other.value == value)&&(identical(other.color, color) || other.color == color)&&(identical(other.player, player) || other.player == player));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value,color,player);

@override
String toString() {
  return 'OneCard(value: $value, color: $color, player: $player)';
}


}

/// @nodoc
abstract mixin class $OneCardCopyWith<$Res>  {
  factory $OneCardCopyWith(OneCard value, $Res Function(OneCard) _then) = _$OneCardCopyWithImpl;
@useResult
$Res call({
 String value, CardColor color, String? player
});




}
/// @nodoc
class _$OneCardCopyWithImpl<$Res>
    implements $OneCardCopyWith<$Res> {
  _$OneCardCopyWithImpl(this._self, this._then);

  final OneCard _self;
  final $Res Function(OneCard) _then;

/// Create a copy of OneCard
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? value = null,Object? color = null,Object? player = freezed,}) {
  return _then(_self.copyWith(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as CardColor,player: freezed == player ? _self.player : player // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _OneCard implements OneCard {
  const _OneCard({required this.value, required this.color, this.player});
  factory _OneCard.fromJson(Map<String, dynamic> json) => _$OneCardFromJson(json);

@override final  String value;
@override final  CardColor color;
@override final  String? player;

/// Create a copy of OneCard
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OneCardCopyWith<_OneCard> get copyWith => __$OneCardCopyWithImpl<_OneCard>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OneCardToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OneCard&&(identical(other.value, value) || other.value == value)&&(identical(other.color, color) || other.color == color)&&(identical(other.player, player) || other.player == player));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value,color,player);

@override
String toString() {
  return 'OneCard(value: $value, color: $color, player: $player)';
}


}

/// @nodoc
abstract mixin class _$OneCardCopyWith<$Res> implements $OneCardCopyWith<$Res> {
  factory _$OneCardCopyWith(_OneCard value, $Res Function(_OneCard) _then) = __$OneCardCopyWithImpl;
@override @useResult
$Res call({
 String value, CardColor color, String? player
});




}
/// @nodoc
class __$OneCardCopyWithImpl<$Res>
    implements _$OneCardCopyWith<$Res> {
  __$OneCardCopyWithImpl(this._self, this._then);

  final _OneCard _self;
  final $Res Function(_OneCard) _then;

/// Create a copy of OneCard
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,Object? color = null,Object? player = freezed,}) {
  return _then(_OneCard(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as CardColor,player: freezed == player ? _self.player : player // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
