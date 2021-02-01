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

  factory Farmer.fromFireStore(Map<String, dynamic> firestore){
    if (firestore == null) return null;
    return Farmer(userId: firestore['userId'], email: firestore['email']);
  }

}
