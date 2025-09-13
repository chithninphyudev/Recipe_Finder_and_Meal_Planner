// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipes_by_ingredients_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$recipesByingredientsControllerHash() =>
    r'f8e79b7ae6056e0e6b15d73ca12436eecfde95d6';

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

abstract class _$RecipesByingredientsController
    extends BuildlessAutoDisposeAsyncNotifier<List<RecipeByIngredients>> {
  late final List<String> ingredients;

  FutureOr<List<RecipeByIngredients>> build(
    List<String> ingredients,
  );
}

/// See also [RecipesByingredientsController].
@ProviderFor(RecipesByingredientsController)
const recipesByingredientsControllerProvider =
    RecipesByingredientsControllerFamily();

/// See also [RecipesByingredientsController].
class RecipesByingredientsControllerFamily
    extends Family<AsyncValue<List<RecipeByIngredients>>> {
  /// See also [RecipesByingredientsController].
  const RecipesByingredientsControllerFamily();

  /// See also [RecipesByingredientsController].
  RecipesByingredientsControllerProvider call(
    List<String> ingredients,
  ) {
    return RecipesByingredientsControllerProvider(
      ingredients,
    );
  }

  @override
  RecipesByingredientsControllerProvider getProviderOverride(
    covariant RecipesByingredientsControllerProvider provider,
  ) {
    return call(
      provider.ingredients,
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
  String? get name => r'recipesByingredientsControllerProvider';
}

/// See also [RecipesByingredientsController].
class RecipesByingredientsControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<RecipesByingredientsController,
        List<RecipeByIngredients>> {
  /// See also [RecipesByingredientsController].
  RecipesByingredientsControllerProvider(
    List<String> ingredients,
  ) : this._internal(
          () => RecipesByingredientsController()..ingredients = ingredients,
          from: recipesByingredientsControllerProvider,
          name: r'recipesByingredientsControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$recipesByingredientsControllerHash,
          dependencies: RecipesByingredientsControllerFamily._dependencies,
          allTransitiveDependencies:
              RecipesByingredientsControllerFamily._allTransitiveDependencies,
          ingredients: ingredients,
        );

  RecipesByingredientsControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.ingredients,
  }) : super.internal();

  final List<String> ingredients;

  @override
  FutureOr<List<RecipeByIngredients>> runNotifierBuild(
    covariant RecipesByingredientsController notifier,
  ) {
    return notifier.build(
      ingredients,
    );
  }

  @override
  Override overrideWith(RecipesByingredientsController Function() create) {
    return ProviderOverride(
      origin: this,
      override: RecipesByingredientsControllerProvider._internal(
        () => create()..ingredients = ingredients,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        ingredients: ingredients,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<RecipesByingredientsController,
      List<RecipeByIngredients>> createElement() {
    return _RecipesByingredientsControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RecipesByingredientsControllerProvider &&
        other.ingredients == ingredients;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, ingredients.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin RecipesByingredientsControllerRef
    on AutoDisposeAsyncNotifierProviderRef<List<RecipeByIngredients>> {
  /// The parameter `ingredients` of this provider.
  List<String> get ingredients;
}

class _RecipesByingredientsControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<
        RecipesByingredientsController,
        List<RecipeByIngredients>> with RecipesByingredientsControllerRef {
  _RecipesByingredientsControllerProviderElement(super.provider);

  @override
  List<String> get ingredients =>
      (origin as RecipesByingredientsControllerProvider).ingredients;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
