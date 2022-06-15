class User {
  String? name;
  String? gender;
  String? phoneNumber;
  String? email;
  String? password;
  String? username;
  String? secretKey;
  String? type;
  String? token;

  User({
    this.email,
    this.password,
    this.gender,
    this.phoneNumber,
    this.type,
    this.token,
    this.name,
    this.secretKey,
    this.username,
  });

  User.fromJson(Map<String, dynamic> json)
      : this(
          email: json['email'],
          name: json['name'],
          password: json['password'],
          username: json['username'],
          type: json['type'],
          secretKey: json['secretKey'],
          phoneNumber: json['phone_number'],
          token: json['token'],
        );

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'gender': gender,
        'type': type,
        'password': password,
        'phone_number': phoneNumber,
        'secret_key': secretKey,
        'username': username,
      };
}
