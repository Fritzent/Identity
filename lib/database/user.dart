import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 3)
class User extends HiveObject {
  @HiveField(0)
  final String userId;

  @HiveField(1)
  final String username;

  @HiveField(2)
  final String email;

  User({required this.userId, required this.username, required this.email});
}
