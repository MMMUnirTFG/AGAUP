import 'dart:convert';
import 'package:second_blood/model/license.dart';

// ......................................................
// Código generado por https://quicktype.io/ a partir de la llamada a la REST API de SnipeIT: '$serverUrl/users/$userId/licenses';
// ......................................................

LicenseList licenseListFromJson(String str) => LicenseList.fromJson(json.decode(str));

String licenseListToJson(LicenseList data) => json.encode(data.toJson());

class LicenseList {
  final int total;
  final List<License> licenses;

  LicenseList({
    required this.total,
    required this.licenses,
  });

  factory LicenseList.fromJson(Map<String, dynamic> json) => LicenseList(
    total: json["total"] ?? 0,
    licenses: json["rows"] == null ? [] : List<License>.from(json["rows"].map((x) => License.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "rows": List<dynamic>.from(licenses.map((x) => x.toJson())),
  };
}
