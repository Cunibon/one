// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Player {

 String get name; Map<String, OneCard> get hand; WebSocketChannel get channel;
/// Create a copy of Player
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayerCopyWith<Player> get copyWith => _$PlayerCopyWithImpl<Player>(this as Player, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Player&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.hand, hand)&&(identical(other.channel, channel) || other.channel == channel));
}


@override
int get hashCode => Object.hash(runtimeType,name,const DeepCollectionEquality().hash(hand),channel);

@override
String toString() {
  return 'Player(name: $name, hand: $hand, channel: $channel)';
}


}

/// @nodoc
abstract mixin class $PlayerCopyWith<$Res>  {
  factory $PlayerCopyWith(Player value, $Res Function(Player) _then) = _$PlayerCopyWithImpl;
@useResult
$Res call({
 String name, Map<String, OneCard> hand, WebSocketChannel channel
});




}
/// @nodoc
class _$PlayerCopyWithImpl<$Res>
    implements $PlayerCopyWith<$Res> {
  _$PlayerCopyWithImpl(this._self, this._then);

  final Player _self;
  final $Res Function(Player) _then;

/// Create a copy of Player
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? hand = null,Object? channel = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,hand: null == hand ? _self.hand : hand // ignore: cast_nullable_to_non_nullable
as Map<String, OneCard>,channel: null == channel ? _self.channel : channel // ignore: cast_nullable_to_non_nullable
as WebSocketChannel,
  ));
}

}


/// @nodoc


class _Player implements Player {
  const _Player({required this.name, required final  Map<String, OneCard> hand, required this.channel}): _hand = hand;
  

@override final  String name;
 final  Map<String, OneCard> _hand;
@override Map<String, OneCard> get hand {
  if (_hand is EqualUnmodifiableMapView) return _hand;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_hand);
}

@override final  WebSocketChannel channel;

/// Create a copy of Player
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlayerCopyWith<_Player> get copyWith => __$PlayerCopyWithImpl<_Player>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Player&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other._hand, _hand)&&(identical(other.channel, channel) || other.channel == channel));
}


@override
int get hashCode => Object.hash(runtimeType,name,const DeepCollectionEquality().hash(_hand),channel);

@override
String toString() {
  return 'Player(name: $name, hand: $hand, channel: $channel)';
}


}

/// @nodoc
abstract mixin class _$PlayerCopyWith<$Res> implements $PlayerCopyWith<$Res> {
  factory _$PlayerCopyWith(_Player value, $Res Function(_Player) _then) = __$PlayerCopyWithImpl;
@override @useResult
$Res call({
 String name, Map<String, OneCard> hand, WebSocketChannel channel
});




}
/// @nodoc
class __$PlayerCopyWithImpl<$Res>
    implements _$PlayerCopyWith<$Res> {
  __$PlayerCopyWithImpl(this._self, this._then);

  final _Player _self;
  final $Res Function(_Player) _then;

/// Create a copy of Player
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? hand = null,Object? channel = null,}) {
  return _then(_Player(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,hand: null == hand ? _self._hand : hand // ignore: cast_nullable_to_non_nullable
as Map<String, OneCard>,channel: null == channel ? _self.channel : channel // ignore: cast_nullable_to_non_nullable
as WebSocketChannel,
  ));
}


}

// dart format on
