class TodoModel {
  String title;
  String subtitle;
  bool isDone;

  TodoModel({
    required this.title,
    required this.subtitle,
    this.isDone = false,
  });
}
