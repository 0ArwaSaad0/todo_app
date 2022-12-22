class Tasks {
  String id;
  String title;
  String description;
  int date;
  bool isDone;
  Tasks(
      {required this.title,
      required this.date,
      required this.description,
      this.id = '',
      this.isDone = false});
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "date": date,
      "isDone": isDone
    };
  }

  Tasks.fromJson(Map<String, dynamic> json)
      : this(
            //named Constactor
            id: json["id"],
            title: json["title"],
            date: json["date"],
            description: json["description"],
            isDone: json["isDone"]);
}
