class Token {
  Token(this.token);
  final String token;

  Map<String, dynamic> toJson() =>
      {'Token': token};
}