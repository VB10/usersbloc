import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'reqres_model.g.dart';

@JsonSerializable()
class ReqresModel extends INetworkModel<ReqresModel> {
  int? page;
  int? perPage;
  int? total;
  int? totalPages;
  List<Data>? data;

  ReqresModel({this.page, this.perPage, this.total, this.totalPages, this.data});

  factory ReqresModel.fromJson(Map<String, dynamic> json) {
    return _$ReqresModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$ReqresModelToJson(this);
  }

  @override
  ReqresModel fromJson(Map<String, Object>? json) {
    return _$ReqresModelFromJson(json ?? {});
  }
}

@JsonSerializable()
class Data extends INetworkModel<Data> {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  Data({this.id, this.email, this.firstName, this.lastName, this.avatar});

  factory Data.fromJson(Map<String, dynamic> json) {
    return _$DataFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$DataToJson(this);
  }

  @override
  Data fromJson(Map<String, Object>? json) {
    return _$DataFromJson(json ?? {});
  }
}
