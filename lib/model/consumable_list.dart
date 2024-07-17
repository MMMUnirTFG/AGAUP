import 'dart:convert';
import 'package:second_blood/model/consumable.dart';

// ......................................................
// Código generado por https://quicktype.io/ a partir de la llamada a la REST API de SnipeIT: '$serverUrl/consumables';
// ......................................................

ConsumableList consumableListFromJson(String str) => ConsumableList.fromJson(json.decode(str));

String consumableListToJson(ConsumableList data) => json.encode(data.toJson());

class ConsumableList {
  final int? total;
  final List<Consumable>? consumables;

  ConsumableList({
    this.total,
    this.consumables,
  });

  factory ConsumableList.fromJson(Map<String, dynamic> json) => ConsumableList(
    total: json["total"] ?? 0,
    consumables: json["rows"] == null ? [] : List<Consumable>.from(json["rows"]!.map((x) => Consumable.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "rows": consumables == null ? [] : List<dynamic>.from(consumables!.map((x) => x.toJson())),
  };
}
