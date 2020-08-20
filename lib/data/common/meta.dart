import 'package:json_annotation/json_annotation.dart';

part 'meta.g.dart';

@JsonSerializable()
class Meta {
  @JsonKey(name: "current_page")
  final int currentPage;
  final int from;
  @JsonKey(name: "per_page")
  final int perPage;
  @JsonKey(name: "last_page")
  final int lastPage;
  final int to;
  final int total;

  final String path;

  const Meta(this.currentPage, this.from, this.perPage, this.lastPage, this.to,
      this.total, this.path);

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

  Map<String, dynamic> toJson() => _$MetaToJson(this);
}
