// To parse this JSON data, do
//
//     final currentAttendModel = currentAttendModelFromJson(jsonString);

import 'dart:convert';

CurrentAttendModel currentAttendModelFromJson(String str) => CurrentAttendModel.fromJson(json.decode(str));

String currentAttendModelToJson(CurrentAttendModel data) => json.encode(data.toJson());

class CurrentAttendModel {
  List<Item>? items;

  CurrentAttendModel({
    this.items,
  });

  factory CurrentAttendModel.fromJson(Map<String, dynamic> json) => CurrentAttendModel(
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "items": List<dynamic>.from(items!.map((x) => x.toJson())),
  };
}

class Item {
  String? attendPreix;
  String? attendTime;
  String? attendColor;

  Item({
    this.attendPreix,
    this.attendTime,
    this.attendColor,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    attendPreix: json["attend_preix"]??" ",
    attendTime: json["attend_time"]??" ",
    attendColor: json["attend_color"]??" ",
  );

  Map<String, dynamic> toJson() => {
    "attend_preix": attendPreix,
    "attend_time": attendTime,
    "attend_color": attendColor,
  };
}
