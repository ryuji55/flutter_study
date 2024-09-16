class User {
  String name;
  String uuid;
  String? imageUrl;
  String lastMessage;

  User({
    required this.name,
    required this.uuid,
    this.imageUrl,
    this.lastMessage = '',
  });
}
