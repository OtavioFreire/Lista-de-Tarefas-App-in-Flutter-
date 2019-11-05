class Task {
  int id;
  String title;
  String description;
  bool isDone;
  String priority;

  Task({
    this.id,
    this.title,
    this.description,
    this.isDone = false,
    this.priority,
  });

  factory Task.fromMap(Map<String, dynamic> json) => Task(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        isDone: json["isDone"] == 1,
        priority: json["priority"],
      );

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "id": id,
      "title": title,
      "description": description,
      "isDone": isDone ? 1 : 0,
      "priority": priority
    };

    if (id != null) map["id"] = id;

    return map;
  }
}
