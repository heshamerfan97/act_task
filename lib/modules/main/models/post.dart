class Post {
  final int id, userId;
  final String title, body;

  Post({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
  });

  factory Post.fromJson(Map<String, dynamic>? json) => Post(
        id: json?['id'] ?? -1,
        userId: json?['userId'] ?? -1,
        title: json?['title'] ?? 'title',
        body: json?['body'] ?? 'body',
      );
}
