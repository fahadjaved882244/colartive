// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist_profile_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchArtistHash() => r'99ea385068a762f224e7d82526761f2a4f17589b';

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

typedef FetchArtistRef = AutoDisposeFutureProviderRef<BaseState<AppUser>>;

/// See also [fetchArtist].
@ProviderFor(fetchArtist)
const fetchArtistProvider = FetchArtistFamily();

/// See also [fetchArtist].
class FetchArtistFamily extends Family<AsyncValue<BaseState<AppUser>>> {
  /// See also [fetchArtist].
  const FetchArtistFamily();

  /// See also [fetchArtist].
  FetchArtistProvider call(
    String uid,
  ) {
    return FetchArtistProvider(
      uid,
    );
  }

  @override
  FetchArtistProvider getProviderOverride(
    covariant FetchArtistProvider provider,
  ) {
    return call(
      provider.uid,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'fetchArtistProvider';
}

/// See also [fetchArtist].
class FetchArtistProvider
    extends AutoDisposeFutureProvider<BaseState<AppUser>> {
  /// See also [fetchArtist].
  FetchArtistProvider(
    this.uid,
  ) : super.internal(
          (ref) => fetchArtist(
            ref,
            uid,
          ),
          from: fetchArtistProvider,
          name: r'fetchArtistProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchArtistHash,
          dependencies: FetchArtistFamily._dependencies,
          allTransitiveDependencies:
              FetchArtistFamily._allTransitiveDependencies,
        );

  final String uid;

  @override
  bool operator ==(Object other) {
    return other is FetchArtistProvider && other.uid == uid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, uid.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$fetchTopArtistListHash() =>
    r'bc4836a9120517a670372379c102ac0c68db128f';

/// See also [fetchTopArtistList].
@ProviderFor(fetchTopArtistList)
final fetchTopArtistListProvider =
    AutoDisposeFutureProvider<BaseState<List<AppUser>>>.internal(
  fetchTopArtistList,
  name: r'fetchTopArtistListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchTopArtistListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchTopArtistListRef
    = AutoDisposeFutureProviderRef<BaseState<List<AppUser>>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
