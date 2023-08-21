class ProfileModel {
    bool? success;
    String message;
    User user;

    ProfileModel({
         this.success,
         this.message = "no-message",
        required this.user,
    });

    factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        success: json["success"],
        message: json["message"],
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "user": user.toJson(),
    };
}

class User {
    int id;
    String username;
    String email;
    String image;
    dynamic emailVerifiedAt;
    DateTime? createdAt;
    DateTime? updatedAt;

    User({
         this.id = 0,
         this.username = "no-username",
         this.email = "no-email",
         this.image = "no-image",
         this.emailVerifiedAt,
         this.createdAt,
         this.updatedAt,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
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
