import 'dart:convert';

class Post {
  int? id;
  List<Photo>? photos;
  String? description;
  String? contactInfo;
  bool? postType;
  DateTime? datePosted;
  bool? state;
  int? likes;
  int? userInfo;

  Post(
      {this.id,
      this.photos,
      this.description,
      this.contactInfo,
      this.postType,
      this.datePosted,
      this.state,
      this.likes,
      this.userInfo});

  Post.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['photos'] != null) {
      photos = <Photo>[];
      json['photos'].forEach((v) {
        photos?.add(Photo.fromJson(v));
      });
    }
    description = json['description'];
    contactInfo = json['contact_info'];
    postType = json['post_type'];
    datePosted = json['date_posted'] != null
        ? DateTime.parse(json['date_posted'])
        : null;
    state = json['state'];
    likes = json['likes'];
    userInfo = json['user_info'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id.toString();
    if (photos != null) {
      data['photos'] = photos?.map((v) => v.toJson()).toList();
    }
    data['description'] = description;
    data['contact_info'] = contactInfo;
    data['post_type'] = postType;
    data['date_posted'] = datePosted?.toIso8601String();
    data['state'] = state;
    data['likes'] = likes;
    data['user_info'] = userInfo.toString();
    return data;
  }

  String toJsonString() => jsonEncode(toJson());
}

class Photo {
  int? id;
  String? image;
  int? post;

  Photo({this.id, this.image, this.post});

  Photo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    post = json['post'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id.toString();
    data['image'] = image;
    data['post'] = post.toString();
    return data;
  }
}
