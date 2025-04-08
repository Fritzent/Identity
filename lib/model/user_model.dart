import 'dart:convert';

List<UserModels> userModelFromJson(String str) =>
    List<UserModels>.from(json.decode(str).map((x) => UserModels.fromJson(x)));

String userModelToJson(List<UserModels> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModels {
  final String username;
  final String email;
  final String userId;
  final String authUserId;

  UserModels({
    required this.username,
    required this.email,
    required this.userId,
    required this.authUserId,
  });

  UserModels copyWith({
    String? username,
    String? email,
    String? userId,
    String? authUserId,
  }) =>
      UserModels(
        username: username ?? this.username,
        email: email ?? this.email,
        userId: userId ?? this.userId,
        authUserId: authUserId ?? this.authUserId,
      );

  factory UserModels.fromJson(Map<String, dynamic> json) => UserModels(
        username: json["username"],
        email: json["email"],
        userId: json["user_id"],
        authUserId: json["authUserId"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "user_id": userId,
        "authUserId": authUserId,
      };
}
