// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$serverIPHash() => r'f05496787fcf683a604f76b66d43265edcaf1f3b';

/// See also [ServerIP].
@ProviderFor(ServerIP)
final serverIPProvider = NotifierProvider<ServerIP, String>.internal(
  ServerIP.new,
  name: r'serverIPProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$serverIPHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ServerIP = Notifier<String>;
String _$clientHash() => r'44e255f5ebd6cbf4581abd877ed38ac05759436a';

/// See also [Client].
@ProviderFor(Client)
final clientProvider =
    AutoDisposeStreamNotifierProvider<Client, GameState>.internal(
      Client.new,
      name: r'clientProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product') ? null : _$clientHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$Client = AutoDisposeStreamNotifier<GameState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
