// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vector_art_thumbnail_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$vectorArtThumbnailControllerHash() =>
    r'0c814418d9ab209adc37276e6564e681c6036feb';

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

typedef VectorArtThumbnailControllerRef
    = AutoDisposeFutureProviderRef<VectorArt>;

/// See also [vectorArtThumbnailController].
@ProviderFor(vectorArtThumbnailController)
const vectorArtThumbnailControllerProvider =
    VectorArtThumbnailControllerFamily();

/// See also [vectorArtThumbnailController].
class VectorArtThumbnailControllerFamily extends Family<AsyncValue<VectorArt>> {
  /// See also [vectorArtThumbnailController].
  const VectorArtThumbnailControllerFamily();

  /// See also [vectorArtThumbnailController].
  VectorArtThumbnailControllerProvider call({
    required VectorArtWrapper wrapper,
  }) {
    return VectorArtThumbnailControllerProvider(
      wrapper: wrapper,
    );
  }

  @override
  VectorArtThumbnailControllerProvider getProviderOverride(
    covariant VectorArtThumbnailControllerProvider provider,
  ) {
    return call(
      wrapper: provider.wrapper,
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
  String? get name => r'vectorArtThumbnailControllerProvider';
}

/// See also [vectorArtThumbnailController].
class VectorArtThumbnailControllerProvider
    extends AutoDisposeFutureProvider<VectorArt> {
  /// See also [vectorArtThumbnailController].
  VectorArtThumbnailControllerProvider({
    required this.wrapper,
  }) : super.internal(
          (ref) => vectorArtThumbnailController(
            ref,
            wrapper: wrapper,
          ),
          from: vectorArtThumbnailControllerProvider,
          name: r'vectorArtThumbnailControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$vectorArtThumbnailControllerHash,
          dependencies: VectorArtThumbnailControllerFamily._dependencies,
          allTransitiveDependencies:
              VectorArtThumbnailControllerFamily._allTransitiveDependencies,
        );

  final VectorArtWrapper wrapper;

  @override
  bool operator ==(Object other) {
    return other is VectorArtThumbnailControllerProvider &&
        other.wrapper == wrapper;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, wrapper.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
