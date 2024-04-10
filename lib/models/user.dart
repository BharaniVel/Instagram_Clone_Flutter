import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String email;
  final String uid;
  final String username;
  final List follwers;
  final List following;

  const User({
    required this.email,
    required this.uid,
    required this.username,
    required this.follwers,
    required this.following,
  });
  Map<String, dynamic> toJson() => {
        "username": username,
        'uid': uid,
        'email': email,
        'followers': follwers,
        'following': following,
      };

  static User fromSnap(DocumentSnapshot snapshot) {
    var snap = snapshot.data() as Map<String, dynamic>;
    return User(
      username: snapshot['username'],
      uid: snapshot['uid'],
      email: snapshot['email'],
      follwers: snap['followers'],
      following: snap['following'],
    );
  }
}
