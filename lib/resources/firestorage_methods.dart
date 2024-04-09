import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:instagram_clone/models/post.dart';
import 'package:instagram_clone/resources/storage_method.dart';
import 'package:uuid/uuid.dart';

class FireStorageMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> uploadPost(
    String descrption,
    Uint8List file,
    String uid,
    String username,
  ) async {
    String res = 'Some-error has Occured';
    try {
      String photoURL =
          await StorageMethods().uploadImagetoStorage('posts', file, true);
      String postId = const Uuid().v1();
      Post post = Post(
        uid: uid,
        username: username,
        postId: postId,
        datepublished: DateTime.now(),
        likes: [],
        postURL: photoURL,
        descrption: descrption,
      );
      await _firestore.collection('posts').doc(postId).set(post.toJson());
      res = 'Success';
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
