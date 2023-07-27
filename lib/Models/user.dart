class CustomUser {
  int? id;
  DateTime? lastLogin;
  late String email;
  late String password;
  late String? username;
  late String? bio;
  late String? contactInfo;
  String? image;
  DateTime? createdAt;
  DateTime? updatedAt;
  bool? isStaff;
  bool? isSuperuser;
  bool? isActive;
  int? ratingCount;
  int? ratingSum;

  CustomUser(
      {this.id,
      this.lastLogin,
      required this.email,
      required this.password,
      this.username,
      this.bio,
      this.contactInfo,
      this.image,
      this.createdAt,
      this.updatedAt,
      this.isStaff,
      this.isSuperuser,
      this.isActive,
      this.ratingCount,
      this.ratingSum});

  CustomUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    lastLogin =
        json['last_login'] != null ? DateTime.parse(json['last_login']) : null;
    email = json['email'];

    username = json['username'];
    bio = json['bio'];
    contactInfo = json['contact_info'];
    image = json['image'];
    createdAt =
        json['created_at'] != null ? DateTime.parse(json['created_at']) : null;
    updatedAt =
        json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null;
    isStaff = json['is_staff'];
    isSuperuser = json['is_superuser'];
    isActive = json['is_active'];
    ratingCount = json['rating_count'];
    ratingSum = json['rating_sum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['last_login'] = lastLogin?.toIso8601String();
    data['email'] = email;

    data['username'] = username;
    data['bio'] = bio;
    data['contact_info'] = contactInfo;
    data['image'] = image;
    data['created_at'] = createdAt?.toIso8601String();
    data['updated_at'] = updatedAt?.toIso8601String();
    data['is_staff'] = isStaff;
    data['is_superuser'] = isSuperuser;
    data['is_active'] = isActive;
    data['rating_count'] = ratingCount;
    data['rating_sum'] = ratingSum;
    return data;
  }
}
