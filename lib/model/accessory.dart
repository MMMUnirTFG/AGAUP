import 'dart:convert';
import 'package:second_blood/model/category.dart';

// ......................................................
// Código generado por https://quicktype.io/ a partir de la llamada a la REST API de SnipeIT: '$serverUrl/users/$userId/accessories';
// Accessory es un elemento de la lista obtenida en la llamada a la REST API de SnipeIT.
// ......................................................

Accessory accessoryFromJson(String str) => Accessory.fromJson(json.decode(str));

String accessoryToJson(Accessory data) => json.encode(data.toJson());

class Accessory {
  final int? id;
  final String? name;
  final String? image;
  //final dynamic company;
  final Category? manufacturer;
  final Category? supplier;
  final String? modelNumber;
  final Category? category;
  final Category? location;
  final dynamic notes;
//    final int qty;
//    final dynamic purchaseDate;
//    final dynamic purchaseCost;
//    final dynamic orderNumber;
//    final int minQty;
//    final int remainingQty;
//    final int usersCount;
//    final AtedAt createdAt;
//    final AtedAt updatedAt;
//    final AvailableActions availableActions;
//    final bool userCanCheckout;

  Accessory({
    this.id,
    this.name,
    this.image,
//        this.company,
    this.manufacturer,
    this.supplier,
    this.modelNumber,
    this.category,
    this.location,
    this.notes,
//        this.qty,
//        this.purchaseDate,
//        this.purchaseCost,
//        this.orderNumber,
//        this.minQty,
//        this.remainingQty,
//        this.usersCount,
//        this.createdAt,
//        this.updatedAt,
//        this.availableActions,
//        this.userCanCheckout,
  });

  factory Accessory.fromJson(Map<String, dynamic> json) => Accessory(
    id: json["id"] ?? -1,
    name: json["name"] ?? '',
    image: json["image"] ?? '',
//        company: json["company"],
    manufacturer: Category.fromJson(json["manufacturer"] ?? {"id": -1, "name": ""}),
    supplier: Category.fromJson(json["supplier"] ?? {"id": -1, "name": ""}),
    modelNumber: json["model_number"] ?? '',
    category: Category.fromJson(json["category"] ?? {"id": -1, "name": ""}),
    location: Category.fromJson(json["location"] ?? {"id": -1, "name": ""}),
    notes: json["notes"] ?? '',
//        qty: json["qty"],
//        purchaseDate: json["purchase_date"],
//        purchaseCost: json["purchase_cost"],
//        orderNumber: json["order_number"],
//        minQty: json["min_qty"],
//        remainingQty: json["remaining_qty"],
//        usersCount: json["users_count"],
//        createdAt: AtedAt.fromJson(json["created_at"]),
//        updatedAt: AtedAt.fromJson(json["updated_at"]),
//        availableActions: AvailableActions.fromJson(json["available_actions"]),
//        userCanCheckout: json["user_can_checkout"],
  );


  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
//        "company": company,
    "manufacturer": manufacturer?.toJson(),
    "supplier": supplier?.toJson(),
    "model_number": modelNumber,
    "category": category?.toJson(),
    "location": location?.toJson(),
    "notes": notes,
//        "qty": qty,
//        "purchase_date": purchaseDate,
//        "purchase_cost": purchaseCost,
//        "order_number": orderNumber,
//        "min_qty": minQty,
//        "remaining_qty": remainingQty,
//        "users_count": usersCount,
//        "created_at": createdAt.toJson(),
//        "updated_at": updatedAt.toJson(),
//        "available_actions": availableActions.toJson(),
//        "user_can_checkout": userCanCheckout,
  };
}
