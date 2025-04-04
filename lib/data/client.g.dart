// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$serverIPHash() => r'f03687cc487d2ce32cec366490519f1ecf1f4b63';

/// See also [ServerIP].
@ProviderFor(ServerIP)
final serverIPProvider = AutoDisposeNotifierProvider<ServerIP, String>.internal(
  ServerIP.new,
  name: r'serverIPProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$serverIPHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ServerIP = AutoDisposeNotifier<String>;
String _$clientHash() => r'00d767b8d36b30ef9686d3e77976e09b70eada33';

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
