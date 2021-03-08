// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reqres_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReqresModel _$ReqresModelFromJson(Map<String, dynamic> json) {
  return ReqresModel(
    page: json['page'] as int?,
    perPage: json['perPage'] as int?,
    total: json['total'] as int?,
    totalPages: json['totalPages'] as int?,
    data: (json['data'] as List<dynamic>?)
        ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ReqresModelToJson(ReqresModel instance) =>
    <String, dynamic>{
      'page': instance.page,
      'perPage': instance.perPage,
      'total': instance.total,
      'totalPages': instance.totalPages,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    id: json['id'] as int?,
    email: json['email'] as String?,
    firstName: json['firstName'] as String?,
    lastName: json['lastName'] as String?,
    avatar: json['avatar'] as String?,
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'avatar': instance.avatar,
    };
