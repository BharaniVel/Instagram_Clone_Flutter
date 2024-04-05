import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String email;
  final String uid;
  final String username;
  final List followers;
  final List following;

  const User({
    required this.email,
    required this.uid,
    required this.username,
    required this.followers,
    required this.following,
  });

  Map<String, dynamic> toJson() => {
        'username': username,
        'uid': uid,
        'email': email,
        'followers': followers,
        'following': following,
      };

  static User fromsnap(DocumentSnapshot snap) {
    var snapshot = snap.data()! as Map<String, dynamic>;

    return User(
      uid: snapshot['uid'],
      email: snapshot['email'],
      username: snapshot['username']!,
      followers: snapshot['followers'],
      following: snapshot['following'],
    );
  }
}
