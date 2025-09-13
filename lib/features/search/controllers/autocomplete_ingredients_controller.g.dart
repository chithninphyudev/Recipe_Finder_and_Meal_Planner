// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'autocomplete_ingredients_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$autocompleteIngredientsControllerHash() =>
    r'215c93459ecdbcb76ddbcb7eec2150d126a3da17';

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

abstract class _$AutocompleteIngredientsController
    extends BuildlessAutoDisposeAsyncNotifier<List<String>> {
  late final String query;

  FutureOr<List<String>> build(
    String query,
  );
}

/// See also [AutocompleteIngredientsController].
@ProviderFor(AutocompleteIngredientsController)
const autocompleteIngredientsControllerProvider =
    AutocompleteIngredientsControllerFamily();

/// See also [AutocompleteIngredientsController].
class AutocompleteIngredientsControllerFamily
    extends Family<AsyncValue<List<String>>> {
  /// See also [AutocompleteIngredientsController].
  const AutocompleteIngredientsControllerFamily();

  /// See also [AutocompleteIngredientsController].
  AutocompleteIngredientsControllerProvider call(
    String query,
  ) {
    return AutocompleteIngredientsControllerProvider(
      query,
    );
  }

  @override
  AutocompleteIngredientsControllerProvider getProviderOverride(
    covariant AutocompleteIngredientsControllerProvider provider,
  ) {
    return call(
      provider.query,
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
  String? get name => r'autocompleteIngredientsControllerProvider';
}

/// See also [AutocompleteIngredientsController].
class AutocompleteIngredientsControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<
        AutocompleteIngredientsController, List<String>> {
  /// See also [AutocompleteIngredientsController].
  AutocompleteIngredientsControllerProvider(
    String query,
  ) : this._internal(
          () => AutocompleteIngredientsController()..query = query,
          from: autocompleteIngredientsControllerProvider,
          name: r'autocompleteIngredientsControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$autocompleteIngredientsControllerHash,
          dependencies: AutocompleteIngredientsControllerFamily._dependencies,
          allTransitiveDependencies: AutocompleteIngredientsControllerFamily
              ._allTransitiveDependencies,
          query: query,
        );

  AutocompleteIngredientsControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.query,
  }) : super.internal();

  final String query;

  @override
  FutureOr<List<String>> runNotifierBuild(
    covariant AutocompleteIngredientsController notifier,
  ) {
    return notifier.build(
      query,
    );
  }

  @override
  Override overrideWith(AutocompleteIngredientsController Function() create) {
    return ProviderOverride(
      origin: this,
      override: AutocompleteIngredientsControllerProvider._internal(
        () => create()..query = query,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        query: query,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<AutocompleteIngredientsController,
      List<String>> createElement() {
    return _AutocompleteIngredientsControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AutocompleteIngredientsControllerProvider &&
        other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AutocompleteIngredientsControllerRef
    on AutoDisposeAsyncNotifierProviderRef<List<String>> {
  /// The parameter `query` of this provider.
  String get query;
}

class _AutocompleteIngredientsControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<
        AutocompleteIngredientsController,
        List<String>> with AutocompleteIngredientsControllerRef {
  _AutocompleteIngredientsControllerProviderElement(super.provider);

  @override
  String get query =>
      (origin as AutocompleteIngredientsControllerProvider).query;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
