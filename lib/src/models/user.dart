class Farmer {
  final String userId;
  final String email;
  Farmer({this.userId, this.email});

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      "email": email,
    };
  }

  Farmer.fromFireStore(Map<String, dynamic> firestore)
      : userId = firestore['userId'],
        email = firestore['email'];
}
