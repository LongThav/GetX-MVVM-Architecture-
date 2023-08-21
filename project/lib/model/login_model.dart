class SignInModel {
  String message;
  int statusCode;
  Login login;

  SignInModel({
    this.message = "no-message",
    this.statusCode = 0,
    required this.login,
  });

  factory SignInModel.fromJson(Map<String, dynamic> json) => SignInModel(
        message: json["message"],
        statusCode: json["statusCode"],
        login: Login.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "statusCode": statusCode,
        "data": login.toJson(),
      };
}

class Login {
  String token;
  UserLogin userLogin;

  Login({
    this.token = "no-token",
    required this.userLogin,
  });

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        token: json["token"],
        userLogin: UserLogin.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "user": userLogin.toJson(),
      };
}

class UserLogin {
  int id;
  String username;
  String email;
  String? image;
  String? emailVerifiedAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  UserLogin({
    this.id = 0,
    this.username = "no-username",
    this.email = "no-email",
    this.image = "no-image",
    this.emailVerifiedAt = "no-emailVeri",
    this.createdAt,
    this.updatedAt,
  });

  factory UserLogin.fromJson(Map<String, dynamic> json) => UserLogin(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        image: json["image"],
        emailVerifiedAt: json["email_verified_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "image": image,
        "email_verified_at": emailVerifiedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
