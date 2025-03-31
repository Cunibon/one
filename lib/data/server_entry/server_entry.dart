import 'package:freezed_annotation/freezed_annotation.dart';

part 'server_entry.freezed.dart';
part 'server_entry.g.dart';

@freezed
abstract class ServerEntry with _$ServerEntry {
  const factory ServerEntry({required String name, required String ip}) =
      _ServerEntry;

  factory ServerEntry.fromJson(Map<String, Object?> json) =>
      _ServerEntry.fromJson(json);
}
