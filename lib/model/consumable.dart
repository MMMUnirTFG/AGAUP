import 'package:second_blood/model/category.dart';

// ......................................................
// Código generado por https://quicktype.io/ a partir de la llamada a la REST API de SnipeIT: '$serverUrl/consumables';
// Consumable es un elemento de la lista obtenida en la llamada a la REST API de SnipeIT.
// ......................................................

class Consumable {
  final int? id;
  final String? name;
  final dynamic image;
  final Category? category;
  final Category? company;
  final String? itemNo;
  final dynamic location;
  final Category? manufacturer;
  final Category? supplier;
  final int? minAmt;
  final dynamic modelNumber;
  final int? remaining;
  final String? orderNumber;
//    final String? purchaseCost;
//    final PurchaseDate? purchaseDate;
  final int? qty;
  final dynamic notes;
//    final AtedAt? createdAt;
//    final AtedAt? updatedAt;
//    final bool? userCanCheckout;
//    final AvailableActions? availableActions;

  Consumable({
    this.id,
    this.name,
    this.image,
    this.category,
    this.company,
    this.itemNo,
    this.location,
    this.manufacturer,
    this.supplier,
    this.minAmt,
    this.modelNumber,
    this.remaining,
    this.orderNumber,
//        this.purchaseCost,
//        this.purchaseDate,
    this.qty,
    this.notes,
//        this.createdAt,
//        this.updatedAt,
//        this.userCanCheckout,
//        this.availableActions,
  });

  factory Consumable.fromJson(Map<String, dynamic> json) => Consumable(
    id: json["id"] ?? -1,
    name: json["name"] ?? '',
    image: json["image"] ?? '',
    category: Category.fromJson(json["category"] ?? {"id": -1, "name": ""}),
    company: Category.fromJson(json["company"] ?? {"id": -1, "name": ""}),
    itemNo: json["item_no"] ?? '',
    location: json["location"] ?? '',
    manufacturer: Category.fromJson(json["manufacturer"] ?? {"id": -1, "name": ""}),
    supplier: Category.fromJson(json["supplier"] ?? {"id": -1, "name": ""}),
    minAmt: json["min_amt"] ?? -1,
    modelNumber: json["model_number"] ?? '',
    remaining: json["remaining"] ?? -1,
    orderNumber: json["order_number"] ?? '',
//        purchaseCost: json["purchase_cost"],
//        purchaseDate: json["purchase_date"] == null ? null : PurchaseDate.fromJson(json["purchase_date"]),
    qty: json["qty"] ?? -1,
    notes: json["notes"] ?? '',
//        createdAt: json["created_at"] == null ? null : AtedAt.fromJson(json["created_at"]),
//        updatedAt: json["updated_at"] == null ? null : AtedAt.fromJson(json["updated_at"]),
//        userCanCheckout: json["user_can_checkout"],
//        availableActions: json["available_actions"] == null ? null : AvailableActions.fromJson(json["available_actions"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "category": category?.toJson(),
    "company": company?.toJson(),
    "item_no": itemNo,
    "location": location,
    "manufacturer": manufacturer?.toJson(),
    "supplier": supplier?.toJson(),
    "min_amt": minAmt,
    "model_number": modelNumber,
    "remaining": remaining,
    "order_number": orderNumber,
//        "purchase_cost": purchaseCost,
//        "purchase_date": purchaseDate?.toJson(),
    "qty": qty,
    "notes": notes,
//        "created_at": createdAt?.toJson(),
//        "updated_at": updatedAt?.toJson(),
//        "user_can_checkout": userCanCheckout,
//        "available_actions": availableActions?.toJson(),
  };
}
