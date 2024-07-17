import 'dart:convert';
import 'package:second_blood/model/accessory.dart';

// ......................................................
// Código generado por https://quicktype.io/ a partir de la llamada a la REST API de SnipeIT: '$serverUrl/users/$userId/accessories';
// ......................................................

AccessoriesList accessoriesListFromJson(String str) => AccessoriesList.fromJson(json.decode(str));

String accessoriesListToJson(AccessoriesList data) => json.encode(data.toJson());

class AccessoriesList {
  final int total;
  final List<Accessory> accessories;

  AccessoriesList({
    required this.total,
    required this.accessories,
  });

  factory AccessoriesList.fromJson(Map<String, dynamic> json) => AccessoriesList(
    total: json["total"] ?? 0,
    accessories: json["rows"] == null ? [] : List<Accessory>.from(json["rows"].map((x) => Accessory.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "rows": List<dynamic>.from(accessories.map((x) => x.toJson())),
  };
}
