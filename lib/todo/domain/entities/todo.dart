class Todo {
  final String id;
  final String text;
  final String description;

  Todo(this.id, this.text, this.description);

  // Factory method to create a Todo object from a JSON map
  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      json['id'],
      json['text'],
      json['description'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'text': text,
      'description': description,
    };
  }
}

  // Map<String, dynamic> toMap() {
  //   return {
  //     'id': id,
  //     'text': text,
  //     'description': description,
  //   };
  // }

  // static Future<Todo> fromJson(jsonDecode) {}
