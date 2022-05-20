class CommentsInfo {
  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;

  CommentsInfo(
      {required this.postId,
      required this.id,
      required this.name,
      required this.email,
      required this.body});

  factory CommentsInfo.fromJson(Map<String, dynamic> json) {
    final postId = json['postId'];
    final id = json['id'];
    final name = json['name'];
    final email = json['email'];
    final body = json['body'];

    return CommentsInfo(
        postId: postId, id: id, name: name, email: email, body: body);
  }
}
