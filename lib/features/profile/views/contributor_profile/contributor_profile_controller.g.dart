// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contributor_profile_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchContributorHash() => r'56710b84058f51214cc40adafac2a022ef8027df';

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

typedef FetchContributorRef = AutoDisposeFutureProviderRef<BaseState<AppUser>>;

/// See also [fetchContributor].
@ProviderFor(fetchContributor)
const fetchContributorProvider = FetchContributorFamily();

/// See also [fetchContributor].
class FetchContributorFamily extends Family<AsyncValue<BaseState<AppUser>>> {
  /// See also [fetchContributor].
  const FetchContributorFamily();

  /// See also [fetchContributor].
  FetchContributorProvider call(
    String uid,
  ) {
    return FetchContributorProvider(
      uid,
    );
  }

  @override
  FetchContributorProvider getProviderOverride(
    covariant FetchContributorProvider provider,
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
  String? get name => r'fetchContributorProvider';
}

/// See also [fetchContributor].
class FetchContributorProvider
    extends AutoDisposeFutureProvider<BaseState<AppUser>> {
  /// See also [fetchContributor].
  FetchContributorProvider(
    this.uid,
  ) : super.internal(
          (ref) => fetchContributor(
            ref,
            uid,
          ),
          from: fetchContributorProvider,
          name: r'fetchContributorProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchContributorHash,
          dependencies: FetchContributorFamily._dependencies,
          allTransitiveDependencies:
              FetchContributorFamily._allTransitiveDependencies,
        );

  final String uid;

  @override
  bool operator ==(Object other) {
    return other is FetchContributorProvider && other.uid == uid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, uid.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$fetchTopContributorListHash() =>
    r'ae644ecbde452488a25c519d32a8fc1261b38c21';

/// See also [fetchTopContributorList].
@ProviderFor(fetchTopContributorList)
final fetchTopContributorListProvider =
    AutoDisposeFutureProvider<BaseState<List<AppUser>>>.internal(
  fetchTopContributorList,
  name: r'fetchTopContributorListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchTopContributorListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchTopContributorListRef
    = AutoDisposeFutureProviderRef<BaseState<List<AppUser>>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
