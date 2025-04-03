import 'dart:convert';

List<UserModels> albumFromJson(String str) => List<UserModels>.from(json.decode(str).map((x) => UserModels.fromJson(x)));

String albumToJson(List<UserModels> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModels {
    final String username;
    final String email;
    final String userId;

    UserModels({
        required this.username,
        required this.email,
        required this.userId,
    });

    UserModels copyWith({
        String? username,
        String? email,
        String? userId,
    }) => 
        UserModels(
            username: username ?? this.username,
            email: email ?? this.email,
            userId: userId ?? this.userId,
        );

    factory UserModels.fromJson(Map<String, dynamic> json) => UserModels(
        username: json["username"],
        email: json["email"],
        userId: json["user_id"],
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "user_id": userId,
    };
}
