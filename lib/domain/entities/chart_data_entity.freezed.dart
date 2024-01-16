// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chart_data_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChartDataEntity _$ChartDataEntityFromJson(Map<String, dynamic> json) {
  return _ChartDataEntity.fromJson(json);
}

/// @nodoc
mixin _$ChartDataEntity {
  DateTime get date => throw _privateConstructorUsedError;
  int get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChartDataEntityCopyWith<ChartDataEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChartDataEntityCopyWith<$Res> {
  factory $ChartDataEntityCopyWith(
          ChartDataEntity value, $Res Function(ChartDataEntity) then) =
      _$ChartDataEntityCopyWithImpl<$Res, ChartDataEntity>;
  @useResult
  $Res call({DateTime date, int value});
}

/// @nodoc
class _$ChartDataEntityCopyWithImpl<$Res, $Val extends ChartDataEntity>
    implements $ChartDataEntityCopyWith<$Res> {
  _$ChartDataEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChartDataEntityImplCopyWith<$Res>
    implements $ChartDataEntityCopyWith<$Res> {
  factory _$$ChartDataEntityImplCopyWith(_$ChartDataEntityImpl value,
          $Res Function(_$ChartDataEntityImpl) then) =
      __$$ChartDataEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime date, int value});
}

/// @nodoc
class __$$ChartDataEntityImplCopyWithImpl<$Res>
    extends _$ChartDataEntityCopyWithImpl<$Res, _$ChartDataEntityImpl>
    implements _$$ChartDataEntityImplCopyWith<$Res> {
  __$$ChartDataEntityImplCopyWithImpl(
      _$ChartDataEntityImpl _value, $Res Function(_$ChartDataEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? value = null,
  }) {
    return _then(_$ChartDataEntityImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChartDataEntityImpl implements _ChartDataEntity {
  const _$ChartDataEntityImpl({required this.date, required this.value});

  factory _$ChartDataEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChartDataEntityImplFromJson(json);

  @override
  final DateTime date;
  @override
  final int value;

  @override
  String toString() {
    return 'ChartDataEntity(date: $date, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChartDataEntityImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, date, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChartDataEntityImplCopyWith<_$ChartDataEntityImpl> get copyWith =>
      __$$ChartDataEntityImplCopyWithImpl<_$ChartDataEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChartDataEntityImplToJson(
      this,
    );
  }
}

abstract class _ChartDataEntity implements ChartDataEntity {
  const factory _ChartDataEntity(
      {required final DateTime date,
      required final int value}) = _$ChartDataEntityImpl;

  factory _ChartDataEntity.fromJson(Map<String, dynamic> json) =
      _$ChartDataEntityImpl.fromJson;

  @override
  DateTime get date;
  @override
  int get value;
  @override
  @JsonKey(ignore: true)
  _$$ChartDataEntityImplCopyWith<_$ChartDataEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
