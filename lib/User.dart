class User {
  User(this.username, this.password);
  final String username;
  final String password;
  String token;

  Map<String, dynamic> toJson() =>
      {'username': username, 'password': password};
}