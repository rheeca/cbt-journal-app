class UserModel {
  String userId;
  String email;
  String displayName;
  DateTime createdAt;
  DateTime updatedAt;
  bool isDeleted;

  UserModel({
    required this.userId,
    required this.email,
    required this.displayName,
    required this.createdAt,
    required this.updatedAt,
    required this.isDeleted,
  });
}
