// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'downloads_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DownloadsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getDownloadsImages,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getDownloadsImages,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getDownloadsImages,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetDownloadsImages value) getDownloadsImages,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetDownloadsImages value)? getDownloadsImages,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetDownloadsImages value)? getDownloadsImages,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DownloadsEventCopyWith<$Res> {
  factory $DownloadsEventCopyWith(
          DownloadsEvent value, $Res Function(DownloadsEvent) then) =
      _$DownloadsEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$DownloadsEventCopyWithImpl<$Res>
    implements $DownloadsEventCopyWith<$Res> {
  _$DownloadsEventCopyWithImpl(this._value, this._then);

  final DownloadsEvent _value;
  // ignore: unused_field
  final $Res Function(DownloadsEvent) _then;
}

/// @nodoc
abstract class _$$_GetDownloadsImagesCopyWith<$Res> {
  factory _$$_GetDownloadsImagesCopyWith(_$_GetDownloadsImages value,
          $Res Function(_$_GetDownloadsImages) then) =
      __$$_GetDownloadsImagesCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GetDownloadsImagesCopyWithImpl<$Res>
    extends _$DownloadsEventCopyWithImpl<$Res>
    implements _$$_GetDownloadsImagesCopyWith<$Res> {
  __$$_GetDownloadsImagesCopyWithImpl(
      _$_GetDownloadsImages _value, $Res Function(_$_GetDownloadsImages) _then)
      : super(_value, (v) => _then(v as _$_GetDownloadsImages));

  @override
  _$_GetDownloadsImages get _value => super._value as _$_GetDownloadsImages;
}

/// @nodoc

class _$_GetDownloadsImages implements _GetDownloadsImages {
  const _$_GetDownloadsImages();

  @override
  String toString() {
    return 'DownloadsEvent.getDownloadsImages()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_GetDownloadsImages);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getDownloadsImages,
  }) {
    return getDownloadsImages();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getDownloadsImages,
  }) {
    return getDownloadsImages?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getDownloadsImages,
    required TResult orElse(),
  }) {
    if (getDownloadsImages != null) {
      return getDownloadsImages();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetDownloadsImages value) getDownloadsImages,
  }) {
    return getDownloadsImages(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetDownloadsImages value)? getDownloadsImages,
  }) {
    return getDownloadsImages?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetDownloadsImages value)? getDownloadsImages,
    required TResult orElse(),
  }) {
    if (getDownloadsImages != null) {
      return getDownloadsImages(this);
    }
    return orElse();
  }
}

abstract class _GetDownloadsImages implements DownloadsEvent {
  const factory _GetDownloadsImages() = _$_GetDownloadsImages;
}

/// @nodoc
mixin _$DownloadsState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<Downloads>? get downloads => throw _privateConstructorUsedError;
  Option<Either<MainFailure, List<Downloads>>>
      get downloadsFailuerOrSuccessOption => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DownloadsStateCopyWith<DownloadsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DownloadsStateCopyWith<$Res> {
  factory $DownloadsStateCopyWith(
          DownloadsState value, $Res Function(DownloadsState) then) =
      _$DownloadsStateCopyWithImpl<$Res>;
  $Res call(
      {bool isLoading,
      List<Downloads>? downloads,
      Option<Either<MainFailure, List<Downloads>>>
          downloadsFailuerOrSuccessOption});
}

/// @nodoc
class _$DownloadsStateCopyWithImpl<$Res>
    implements $DownloadsStateCopyWith<$Res> {
  _$DownloadsStateCopyWithImpl(this._value, this._then);

  final DownloadsState _value;
  // ignore: unused_field
  final $Res Function(DownloadsState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? downloads = freezed,
    Object? downloadsFailuerOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      downloads: downloads == freezed
          ? _value.downloads
          : downloads // ignore: cast_nullable_to_non_nullable
              as List<Downloads>?,
      downloadsFailuerOrSuccessOption: downloadsFailuerOrSuccessOption ==
              freezed
          ? _value.downloadsFailuerOrSuccessOption
          : downloadsFailuerOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, List<Downloads>>>,
    ));
  }
}

/// @nodoc
abstract class _$$_DownloadsStateCopyWith<$Res>
    implements $DownloadsStateCopyWith<$Res> {
  factory _$$_DownloadsStateCopyWith(
          _$_DownloadsState value, $Res Function(_$_DownloadsState) then) =
      __$$_DownloadsStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isLoading,
      List<Downloads>? downloads,
      Option<Either<MainFailure, List<Downloads>>>
          downloadsFailuerOrSuccessOption});
}

/// @nodoc
class __$$_DownloadsStateCopyWithImpl<$Res>
    extends _$DownloadsStateCopyWithImpl<$Res>
    implements _$$_DownloadsStateCopyWith<$Res> {
  __$$_DownloadsStateCopyWithImpl(
      _$_DownloadsState _value, $Res Function(_$_DownloadsState) _then)
      : super(_value, (v) => _then(v as _$_DownloadsState));

  @override
  _$_DownloadsState get _value => super._value as _$_DownloadsState;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? downloads = freezed,
    Object? downloadsFailuerOrSuccessOption = freezed,
  }) {
    return _then(_$_DownloadsState(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      downloads: downloads == freezed
          ? _value._downloads
          : downloads // ignore: cast_nullable_to_non_nullable
              as List<Downloads>?,
      downloadsFailuerOrSuccessOption: downloadsFailuerOrSuccessOption ==
              freezed
          ? _value.downloadsFailuerOrSuccessOption
          : downloadsFailuerOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, List<Downloads>>>,
    ));
  }
}

/// @nodoc

class _$_DownloadsState implements _DownloadsState {
  const _$_DownloadsState(
      {required this.isLoading,
      final List<Downloads>? downloads,
      required this.downloadsFailuerOrSuccessOption})
      : _downloads = downloads;

  @override
  final bool isLoading;
  final List<Downloads>? _downloads;
  @override
  List<Downloads>? get downloads {
    final value = _downloads;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Option<Either<MainFailure, List<Downloads>>>
      downloadsFailuerOrSuccessOption;

  @override
  String toString() {
    return 'DownloadsState(isLoading: $isLoading, downloads: $downloads, downloadsFailuerOrSuccessOption: $downloadsFailuerOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DownloadsState &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality()
                .equals(other._downloads, _downloads) &&
            const DeepCollectionEquality().equals(
                other.downloadsFailuerOrSuccessOption,
                downloadsFailuerOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(_downloads),
      const DeepCollectionEquality().hash(downloadsFailuerOrSuccessOption));

  @JsonKey(ignore: true)
  @override
  _$$_DownloadsStateCopyWith<_$_DownloadsState> get copyWith =>
      __$$_DownloadsStateCopyWithImpl<_$_DownloadsState>(this, _$identity);
}

abstract class _DownloadsState implements DownloadsState {
  const factory _DownloadsState(
      {required final bool isLoading,
      final List<Downloads>? downloads,
      required final Option<Either<MainFailure, List<Downloads>>>
          downloadsFailuerOrSuccessOption}) = _$_DownloadsState;

  @override
  bool get isLoading;
  @override
  List<Downloads>? get downloads;
  @override
  Option<Either<MainFailure, List<Downloads>>>
      get downloadsFailuerOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_DownloadsStateCopyWith<_$_DownloadsState> get copyWith =>
      throw _privateConstructorUsedError;
}
