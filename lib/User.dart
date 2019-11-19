class User {
  User(this.username, this.password);
  final String username;
  final String password;
  String currentCity;
  String token;
  String avatarImageUrl;
  String displayName;
  String occupation;

  Map<String, dynamic> toJson() => {
        'username': username,
        'password': password,
        'currentCity': currentCity,
        'displayName': displayName,
        'occupation': occupation,
        'avatarImageUrl': avatarImageUrl,
      };
}
