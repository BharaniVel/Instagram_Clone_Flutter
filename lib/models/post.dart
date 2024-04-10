import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String uid;
  final String username;
  final String postId;
  final DateTime datepublished;
  final String postURL;
  final List likes;
  final String descrption;

  const Post({
    required this.uid,
    required this.username,
    required this.postId,
    required this.datepublished,
    required this.likes,
    required this.postURL,
    required this.descrption,
  });

  Map<String, dynamic> toJson() => {
        'username': username,
        'uid': uid,
        'likes': likes,
        'postId': postId,
        'postURL': postURL,
        'date_published': datepublished,
        'descrption': descrption,
      };

  static Post fromsnap(DocumentSnapshot snap) {
    var snapshot = snap.data()! as Map<String, dynamic>;

    return Post(
      uid: snapshot['uid'],
      postId: snapshot['postId'],
      username: snapshot['username'],
      likes: snapshot['likes'],
      datepublished: snapshot['date_published'],
      postURL: snapshot['postURL'],
      descrption: snapshot['descrption'],
    );
  }
}
