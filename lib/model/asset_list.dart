import 'dart:convert';
import 'package:second_blood/model/asset.dart';

// ......................................................
// Código generado por https://quicktype.io/ a partir de la llamada a la REST API de SnipeIT: '$serverUrl/users/$userId/assets';
// ......................................................

AssetList assetListFromJson(String str) => AssetList.fromJson(json.decode(str));

String assetListToJson(AssetList data) => json.encode(data.toJson());

class AssetList {
  final int total;
  final List<Asset> assets;

  AssetList({
    required this.total,
    required this.assets,
  });

  factory AssetList.fromJson(Map<String, dynamic> json) => AssetList(
    total: json["total"] ?? 0,
    assets: json["rows"] == null ? [] : List<Asset>.from(json["rows"].map((x) => Asset.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "rows": List<dynamic>.from(assets.map((x) => x.toJson())),
  };
}
