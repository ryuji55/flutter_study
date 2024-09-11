class User {
  String name;
  String uid;
  String? imageUrl;
  String lastMessage;

  User({
    required this.name,
    required this.uid,
    this.imageUrl,
    this.lastMessage = '',
  });
}
