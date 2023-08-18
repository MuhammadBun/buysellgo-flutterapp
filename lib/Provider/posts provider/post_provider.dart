import 'package:flutter/cupertino.dart';

import '../../API/Base/api_base_response.dart';
import '../../API/Repositories/posts repository/post_repo.dart';
import '../../Models/post.dart';

class PostProvider extends ChangeNotifier {
  late PostRepository _postRepository;

  late ApiResponse<List<Post>> _postList;
  List<Post> _posts = [];
  List<Post> get posts => _posts;
  ApiResponse<List<Post>> get postList => _postList;

  PostProvider() {
    _postRepository = PostRepository();
    fetchPostList();
  }

  fetchPostList() async {
    _postList = ApiResponse.loading('Fetching Posts');
    notifyListeners();
    try {
      _posts = await _postRepository.fetchPostList();
      _postList = ApiResponse.completed(posts);
      notifyListeners();
      return posts;
    } catch (e) {
      _postList = ApiResponse.error(e.toString());
      notifyListeners();
    }
  }

  Future<void> addPost(Post post) async {
    try {
      await _postRepository.addPost(post);
      _postList = ApiResponse.completed(null);
      fetchPostList();
    } catch (e) {
      _postList = ApiResponse.error(e.toString());
      print(e);
    }
    notifyListeners();
  }

  Future<void> updatePost(Post post) async {
    _postList = ApiResponse.loading('Updating Post');
    int index = _posts.indexWhere((element) => element.id == post.id);
    if (index != -1) {
      _posts[index] = post;
      notifyListeners();
    }

    notifyListeners();
    try {
      await _postRepository.updatePost(post);
      await fetchPostList();
      _postList = ApiResponse.completed(null);
    } catch (e) {
      _postList = ApiResponse.error(e.toString());
    }
    notifyListeners();
  }

  Future<void> deletePost(Post post) async {
    _postList = ApiResponse.loading('Deleting Post');
    int index = _posts.indexWhere((element) => element.id == post.id);
    if (index != -1) {
      _posts.removeAt(index);
      notifyListeners();
    }

    notifyListeners();
    try {
      await _postRepository.deletePost(post);
      await fetchPostList();
      notifyListeners();

      _postList = ApiResponse.completed(null);
    } catch (e) {
      _postList = ApiResponse.error(e.toString());
    }
    notifyListeners();
  }
}
