import 'package:json_annotation/json_annotation.dart';

part 'google_login.g.dart';

@JsonSerializable()
class GoogleLogin {
  @JsonKey(name: "google_token")
  final String googleToken;
  final String name;
  final String image;

  const GoogleLogin(this.googleToken, this.name, this.image);

  factory GoogleLogin.fromJson(Map<String, dynamic> json) =>
      _$GoogleLoginFromJson(json);

  Map<String, dynamic> toJson() => _$GoogleLoginToJson(this);
}
