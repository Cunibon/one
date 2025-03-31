// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'server_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ServerEntry {

 String get name; String get ip;
/// Create a copy of ServerEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServerEntryCopyWith<ServerEntry> get copyWith => _$ServerEntryCopyWithImpl<ServerEntry>(this as ServerEntry, _$identity);

  /// Serializes this ServerEntry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServerEntry&&(identical(other.name, name) || other.name == name)&&(identical(other.ip, ip) || other.ip == ip));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,ip);

@override
String toString() {
  return 'ServerEntry(name: $name, ip: $ip)';
}


}

/// @nodoc
abstract mixin class $ServerEntryCopyWith<$Res>  {
  factory $ServerEntryCopyWith(ServerEntry value, $Res Function(ServerEntry) _then) = _$ServerEntryCopyWithImpl;
@useResult
$Res call({
 String name, String ip
});




}
/// @nodoc
class _$ServerEntryCopyWithImpl<$Res>
    implements $ServerEntryCopyWith<$Res> {
  _$ServerEntryCopyWithImpl(this._self, this._then);

  final ServerEntry _self;
  final $Res Function(ServerEntry) _then;

/// Create a copy of ServerEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? ip = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,ip: null == ip ? _self.ip : ip // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ServerEntry implements ServerEntry {
  const _ServerEntry({required this.name, required this.ip});
  factory _ServerEntry.fromJson(Map<String, dynamic> json) => _$ServerEntryFromJson(json);

@override final  String name;
@override final  String ip;

/// Create a copy of ServerEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServerEntryCopyWith<_ServerEntry> get copyWith => __$ServerEntryCopyWithImpl<_ServerEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ServerEntryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServerEntry&&(identical(other.name, name) || other.name == name)&&(identical(other.ip, ip) || other.ip == ip));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,ip);

@override
String toString() {
  return 'ServerEntry(name: $name, ip: $ip)';
}


}

/// @nodoc
abstract mixin class _$ServerEntryCopyWith<$Res> implements $ServerEntryCopyWith<$Res> {
  factory _$ServerEntryCopyWith(_ServerEntry value, $Res Function(_ServerEntry) _then) = __$ServerEntryCopyWithImpl;
@override @useResult
$Res call({
 String name, String ip
});




}
/// @nodoc
class __$ServerEntryCopyWithImpl<$Res>
    implements _$ServerEntryCopyWith<$Res> {
  __$ServerEntryCopyWithImpl(this._self, this._then);

  final _ServerEntry _self;
  final $Res Function(_ServerEntry) _then;

/// Create a copy of ServerEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? ip = null,}) {
  return _then(_ServerEntry(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,ip: null == ip ? _self.ip : ip // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
