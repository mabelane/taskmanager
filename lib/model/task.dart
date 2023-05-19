class Task {
  int? id;
  int? colour;
  int? remind;
  int? done;
  String? title;
  String? note;
  String? date;
  String? startTime;
  String? endTime;
  String? priority;
  int? flag;
  int? tapped;

  Task(
      {this.id,
      this.colour,
      this.remind,
      this.done,
      this.title,
      this.note,
      this.date,
      this.startTime,
      this.endTime,
      this.priority,
      this.flag,
      this.tapped});

  Task.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    note = json["note"];
    date = json["date"];
    startTime = json["startTime"];
    endTime = json["endTime"];
    flag = json["flag"];
    priority = json["priority"];
    remind = json["remind"];
    colour = json["colour"];
    done = json["done"];
    tapped = json["tapped"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["title"] = title;
    data["note"] = note;
    data["date"] = date;
    data["startTime"] = startTime;
    data["endTime"] = endTime;
    data["flag"] = flag;
    data["priority"] = priority;
    data["remind"] = remind;
    data["colour"] = colour;
    data["done"] = done;
    data["tapped"] = tapped;

    return data;
  }
}
