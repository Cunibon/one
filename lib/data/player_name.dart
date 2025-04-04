import 'package:localstorage/localstorage.dart';
import 'package:one/application_constants.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'player_name.g.dart';

@riverpod
class PlayerName extends _$PlayerName {
  @override
  String? build() => localStorage.getItem(nameKey);

  void setName(String name) {
    state = name;
    localStorage.setItem(nameKey, name);
  }
}
