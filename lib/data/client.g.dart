// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$clientHash() => r'0df06dbc2ac69ce4bcfe664e9016947fa8403028';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$Client extends BuildlessAutoDisposeStreamNotifier<GameState> {
  late final String ip;

  Stream<GameState> build(String ip);
}

/// See also [Client].
@ProviderFor(Client)
const clientProvider = ClientFamily();

/// See also [Client].
class ClientFamily extends Family<AsyncValue<GameState>> {
  /// See also [Client].
  const ClientFamily();

  /// See also [Client].
  ClientProvider call(String ip) {
    return ClientProvider(ip);
  }

  @override
  ClientProvider getProviderOverride(covariant ClientProvider provider) {
    return call(provider.ip);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'clientProvider';
}

/// See also [Client].
class ClientProvider
    extends AutoDisposeStreamNotifierProviderImpl<Client, GameState> {
  /// See also [Client].
  ClientProvider(String ip)
    : this._internal(
        () => Client()..ip = ip,
        from: clientProvider,
        name: r'clientProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product') ? null : _$clientHash,
        dependencies: ClientFamily._dependencies,
        allTransitiveDependencies: ClientFamily._allTransitiveDependencies,
        ip: ip,
      );

  ClientProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.ip,
  }) : super.internal();

  final String ip;

  @override
  Stream<GameState> runNotifierBuild(covariant Client notifier) {
    return notifier.build(ip);
  }

  @override
  Override overrideWith(Client Function() create) {
    return ProviderOverride(
      origin: this,
      override: ClientProvider._internal(
        () => create()..ip = ip,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        ip: ip,
      ),
    );
  }

  @override
  AutoDisposeStreamNotifierProviderElement<Client, GameState> createElement() {
    return _ClientProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ClientProvider && other.ip == ip;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, ip.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ClientRef on AutoDisposeStreamNotifierProviderRef<GameState> {
  /// The parameter `ip` of this provider.
  String get ip;
}

class _ClientProviderElement
    extends AutoDisposeStreamNotifierProviderElement<Client, GameState>
    with ClientRef {
  _ClientProviderElement(super.provider);

  @override
  String get ip => (origin as ClientProvider).ip;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
