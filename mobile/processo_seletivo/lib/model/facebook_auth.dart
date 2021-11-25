class FacebookAuth {
  String _name;
  String _firstName;
  String _lastName;
  String _email;
  String _id;

  FacebookAuth(
      {String name,
        String firstName,
        String lastName,
        String email,
        String id}) {
    this._name = name;
    this._firstName = firstName;
    this._lastName = lastName;
    this._email = email;
    this._id = id;
  }

  String get name => this._name;
  set name(String name) => _name = name;
  String get firstName => this._firstName;
  set firstName(String firstName) => _firstName = firstName;
  String get lastName => this._lastName;
  set lastName(String lastName) => _lastName = lastName;
  String get email => this._email;
  set email(String email) => _email = email;
  String get id => this._id;
  set id(String id) => _id = id;

  FacebookAuth.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _email = json['email'];
    _id = json['id'];
  }
}