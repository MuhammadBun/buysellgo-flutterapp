import '../../../Models/post.dart';
import '../../../Shared Preferences/shared_pref.dart';
import '../../Base/api_base_helper.dart';

class PostRepository {
  SharedAppPreferences sharedPrefs = SharedAppPreferences();

  final ApiBaseHelper _helper = ApiBaseHelper(
      token:
          "56e6b32f2ef2fcef9a61e96ab39c15589460594030a4d65d7f7c28f594c1b518");

  Future<List<Post>> fetchPostList() async {
    final response = await _helper.getWithToken("/post/list_post");

    return (response as List).map((post) => Post.fromJson(post)).toList();
  }

  Future<Post> addPost(Post post) async {
    final response = await _helper.post("/post/new_post/", {
      'description': post.description.toString(),
      'post_type': post.postType.toString(),
      'state': post.state.toString(),
      'likes': post.likes.toString(),
    });
    return Post.fromJson(response);
  }

  Future<Post> updatePost(Post post) async {
    final response =
        await _helper.put("/post/post_pk/${post.id}", post.toJson());
    return Post.fromJson(response);
  }

  Future<void> deletePost(Post post) async {
    await _helper.delete("/post/post_pk/${post.id.toString()}");
  }

  Future<List<Post>> searchPost(String query, int userId) async {
    final response = await _helper
        .post("/post/search_post", {'query': query, 'user_id': userId});
    return (response as List).map((post) => Post.fromJson(post)).toList();
  }
}
