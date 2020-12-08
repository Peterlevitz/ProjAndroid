class User {
  int _userId;
  String _nome;
  String _email;
  String _username;
  String _password;

  User(this._nome, this._email, this._password, this._username);
  User.withId(
      this._userId, this._nome, this._email, this._password, this._username);

  int get id => _userId;
  String get nome => this._nome;
  String get email => this._email;
  String get username => this._username;
  String get password => this._password;

  set nome(String newNome) => this._nome = newNome;
  set email(String newEmail) => this._email = newEmail;
  set username(String newUsername) => this._username = newUsername;
  set password(String newPassword) => this._password = newPassword;

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (this._userId != null) map['userId'] = this._userId;
    map['nome'] = this._nome;
    map['email'] = this._email;
    map['username'] = this._username;
    map['password'] = this._password;
    return map;
  }

  User.fromObject(dynamic o) {
    this._userId = o['userId'];
    this._nome = o['nome'];
    this._email = o['email'];
    this._username = o['username'];
    this._password = o['password'];
  }
}
