// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_info_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$recipeInfoControllerHash() =>
    r'87b0620e7d58111350d152384edc49f87aab8bb6';

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

abstract class _$RecipeInfoController
    extends BuildlessAutoDisposeAsyncNotifier<Recipe> {
  late final int id;

  FutureOr<Recipe> build(
    int id,
  );
}

/// See also [RecipeInfoController].
@ProviderFor(RecipeInfoController)
const recipeInfoControllerProvider = RecipeInfoControllerFamily();

/// See also [RecipeInfoController].
class RecipeInfoControllerFamily extends Family<AsyncValue<Recipe>> {
  /// See also [RecipeInfoController].
  const RecipeInfoControllerFamily();

  /// See also [RecipeInfoController].
  RecipeInfoControllerProvider call(
    int id,
  ) {
    return RecipeInfoControllerProvider(
      id,
    );
  }

  @override
  RecipeInfoControllerProvider getProviderOverride(
    covariant RecipeInfoControllerProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'recipeInfoControllerProvider';
}

/// See also [RecipeInfoController].
class RecipeInfoControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<RecipeInfoController, Recipe> {
  /// See also [RecipeInfoController].
  RecipeInfoControllerProvider(
    int id,
  ) : this._internal(
          () => RecipeInfoController()..id = id,
          from: recipeInfoControllerProvider,
          name: r'recipeInfoControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$recipeInfoControllerHash,
          dependencies: RecipeInfoControllerFamily._dependencies,
          allTransitiveDependencies:
              RecipeInfoControllerFamily._allTransitiveDependencies,
          id: id,
        );

  RecipeInfoControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  FutureOr<Recipe> runNotifierBuild(
    covariant RecipeInfoController notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(RecipeInfoController Function() create) {
    return ProviderOverride(
      origin: this,
      override: RecipeInfoControllerProvider._internal(
        () => create()..id = id,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<RecipeInfoController, Recipe>
      createElement() {
    return _RecipeInfoControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RecipeInfoControllerProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin RecipeInfoControllerRef on AutoDisposeAsyncNotifierProviderRef<Recipe> {
  /// The parameter `id` of this provider.
  int get id;
}

class _RecipeInfoControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<RecipeInfoController,
        Recipe> with RecipeInfoControllerRef {
  _RecipeInfoControllerProviderElement(super.provider);

  @override
  int get id => (origin as RecipeInfoControllerProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
