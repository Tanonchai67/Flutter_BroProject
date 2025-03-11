class TodoModel {
  String title;
  String subtitle;
  bool isDone;

  TodoModel({required this.title, required this.subtitle, this.isDone = false});

  Map<String, dynamic> toJson() => {
    'title': title,
    'subtitle': subtitle,
    'isDone': isDone,
  };

  TodoModel.fromJson(Map<String, dynamic> Json)
    : title = Json['title'],
      subtitle = Json['subtitle'],
      isDone = Json['isDone'];
}
