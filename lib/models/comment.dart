class Comment {
  int postId;
  int? id;
  String name;
  String email;
  String body;

  Comment(
      {required this.postId,
      this.id,
      required this.name,
      required this.email,
      required this.body});

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
        postId: json["postId"],
        id: json["id"],
        name: json["name"],
        email: json["email"],
        body: json["body"]);
  }
  Map<String, dynamic> toMap() {
    return {
      "postId": this.postId,
      "id": this.id,
      "name": this.name,
      "email": this.email,
      "body": this.body,
    };
  }
}
