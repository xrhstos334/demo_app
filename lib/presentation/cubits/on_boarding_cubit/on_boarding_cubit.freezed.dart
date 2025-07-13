// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'on_boarding_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OnBoardingState {
  int get currentPage;
  OnBoardingStatus get status;
  List<dynamic> get images;
  List<dynamic> get titles;
  List<dynamic> get descriptions;
  List<dynamic> get highlight;

  /// Create a copy of OnBoardingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OnBoardingStateCopyWith<OnBoardingState> get copyWith =>
      _$OnBoardingStateCopyWithImpl<OnBoardingState>(
          this as OnBoardingState, _$identity);

  @override
  String toString() {
    return 'OnBoardingState(currentPage: $currentPage, status: $status, images: $images, titles: $titles, descriptions: $descriptions, highlight: $highlight)';
  }
}

/// @nodoc
abstract mixin class $OnBoardingStateCopyWith<$Res> {
  factory $OnBoardingStateCopyWith(
          OnBoardingState value, $Res Function(OnBoardingState) _then) =
      _$OnBoardingStateCopyWithImpl;
  @useResult
  $Res call(
      {int currentPage,
      OnBoardingStatus status,
      List<dynamic> images,
      List<dynamic> titles,
      List<dynamic> descriptions,
      List<dynamic> highlight});
}

/// @nodoc
class _$OnBoardingStateCopyWithImpl<$Res>
    implements $OnBoardingStateCopyWith<$Res> {
  _$OnBoardingStateCopyWithImpl(this._self, this._then);

  final OnBoardingState _self;
  final $Res Function(OnBoardingState) _then;

  /// Create a copy of OnBoardingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? status = null,
    Object? images = null,
    Object? titles = null,
    Object? descriptions = null,
    Object? highlight = null,
  }) {
    return _then(_self.copyWith(
      currentPage: null == currentPage
          ? _self.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as OnBoardingStatus,
      images: null == images
          ? _self.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      titles: null == titles
          ? _self.titles
          : titles // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      descriptions: null == descriptions
          ? _self.descriptions
          : descriptions // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      highlight: null == highlight
          ? _self.highlight
          : highlight // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// Adds pattern-matching-related methods to [OnBoardingState].
extension OnBoardingStatePatterns on OnBoardingState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_OnBoardingState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OnBoardingState() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_OnBoardingState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OnBoardingState():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_OnBoardingState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OnBoardingState() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            int currentPage,
            OnBoardingStatus status,
            List<dynamic> images,
            List<dynamic> titles,
            List<dynamic> descriptions,
            List<dynamic> highlight)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OnBoardingState() when $default != null:
        return $default(_that.currentPage, _that.status, _that.images,
            _that.titles, _that.descriptions, _that.highlight);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            int currentPage,
            OnBoardingStatus status,
            List<dynamic> images,
            List<dynamic> titles,
            List<dynamic> descriptions,
            List<dynamic> highlight)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OnBoardingState():
        return $default(_that.currentPage, _that.status, _that.images,
            _that.titles, _that.descriptions, _that.highlight);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            int currentPage,
            OnBoardingStatus status,
            List<dynamic> images,
            List<dynamic> titles,
            List<dynamic> descriptions,
            List<dynamic> highlight)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OnBoardingState() when $default != null:
        return $default(_that.currentPage, _that.status, _that.images,
            _that.titles, _that.descriptions, _that.highlight);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _OnBoardingState implements OnBoardingState {
  const _OnBoardingState(
      {this.currentPage = 0,
      required this.status,
      required final List<dynamic> images,
      required final List<dynamic> titles,
      required final List<dynamic> descriptions,
      required final List<dynamic> highlight})
      : _images = images,
        _titles = titles,
        _descriptions = descriptions,
        _highlight = highlight;

  @override
  @JsonKey()
  final int currentPage;
  @override
  final OnBoardingStatus status;
  final List<dynamic> _images;
  @override
  List<dynamic> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  final List<dynamic> _titles;
  @override
  List<dynamic> get titles {
    if (_titles is EqualUnmodifiableListView) return _titles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_titles);
  }

  final List<dynamic> _descriptions;
  @override
  List<dynamic> get descriptions {
    if (_descriptions is EqualUnmodifiableListView) return _descriptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_descriptions);
  }

  final List<dynamic> _highlight;
  @override
  List<dynamic> get highlight {
    if (_highlight is EqualUnmodifiableListView) return _highlight;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_highlight);
  }

  /// Create a copy of OnBoardingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OnBoardingStateCopyWith<_OnBoardingState> get copyWith =>
      __$OnBoardingStateCopyWithImpl<_OnBoardingState>(this, _$identity);

  @override
  String toString() {
    return 'OnBoardingState(currentPage: $currentPage, status: $status, images: $images, titles: $titles, descriptions: $descriptions, highlight: $highlight)';
  }
}

/// @nodoc
abstract mixin class _$OnBoardingStateCopyWith<$Res>
    implements $OnBoardingStateCopyWith<$Res> {
  factory _$OnBoardingStateCopyWith(
          _OnBoardingState value, $Res Function(_OnBoardingState) _then) =
      __$OnBoardingStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int currentPage,
      OnBoardingStatus status,
      List<dynamic> images,
      List<dynamic> titles,
      List<dynamic> descriptions,
      List<dynamic> highlight});
}

/// @nodoc
class __$OnBoardingStateCopyWithImpl<$Res>
    implements _$OnBoardingStateCopyWith<$Res> {
  __$OnBoardingStateCopyWithImpl(this._self, this._then);

  final _OnBoardingState _self;
  final $Res Function(_OnBoardingState) _then;

  /// Create a copy of OnBoardingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? currentPage = null,
    Object? status = null,
    Object? images = null,
    Object? titles = null,
    Object? descriptions = null,
    Object? highlight = null,
  }) {
    return _then(_OnBoardingState(
      currentPage: null == currentPage
          ? _self.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as OnBoardingStatus,
      images: null == images
          ? _self._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      titles: null == titles
          ? _self._titles
          : titles // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      descriptions: null == descriptions
          ? _self._descriptions
          : descriptions // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      highlight: null == highlight
          ? _self._highlight
          : highlight // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

// dart format on
