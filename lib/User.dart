class User {
  User(this.username, this.password);
  final String username;
  final String password;
  String currentCity;
  String token;
  String avatarImageUrl;
  String displayName;

  Map<String, dynamic> toJson() =>
      {'username': username, 'password': password};
}