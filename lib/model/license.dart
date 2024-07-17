import 'package:second_blood/model/category.dart';

// ......................................................
// Código generado por https://quicktype.io/ a partir de la llamada a la REST API de SnipeIT: '$serverUrl/users/$userId/licenses';
// License es un elemento de la lista obtenida en la llamada a la REST API de SnipeIT.
// ......................................................

class License {
  final int? id;
  final String? name;
  final dynamic company;
  final Category? manufacturer;
  final String? productKey;
//    final String? orderNumber;
//    final dynamic purchaseOrder;
  final Date? purchaseDate;
  final Date? terminationDate;
//    final dynamic depreciation;
//    final String? purchaseCost;
//    final String? purchaseCostNumeric;
  final String? notes;
  final Date? expirationDate;
//    final int? seats;
//    final int? freeSeatsCount;
//    final dynamic minAmt;
  final dynamic licenseName;
  final String? licenseEmail;
//    final bool? reassignable;
//    final bool? maintained;
//    final Category? supplier;
  final Category? category;
//    final AtedAt? createdAt;
//    final AtedAt? updatedAt;
//    final dynamic deletedAt;
//    final bool? userCanCheckout;
//    final AvailableActions? availableActions;

  License({
    this.id,
    this.name,
    this.company,
    this.manufacturer,
    this.productKey,
//        this.orderNumber,
//        this.purchaseOrder,
    this.purchaseDate,
    this.terminationDate,
//        this.depreciation,
//        this.purchaseCost,
//        this.purchaseCostNumeric,
    this.notes,
    this.expirationDate,
//        this.seats,
//        this.freeSeatsCount,
//        this.minAmt,
    this.licenseName,
    this.licenseEmail,
//        this.reassignable,
//        this.maintained,
//        this.supplier,
    this.category,
//        this.createdAt,
//        this.updatedAt,
//        this.deletedAt,
//        this.userCanCheckout,
//        this.availableActions,
  });

  factory License.fromJson(Map<String, dynamic> json) => License(
    id: json["id"] ?? -1,
    name: json["name"] ?? '',
    company: json["company"] ?? '',
    manufacturer: Category.fromJson(json["manufacturer"] ?? {"id": -1, "name": ""}),
    productKey: json["product_key"] ?? '',
//        orderNumber: json["order_number"],
//        purchaseOrder: json["purchase_order"],
    purchaseDate: Date.fromJson(json["purchase_date"] ?? {"date": "1970-01-01", "formatted": "Thu Jan 01, 1970"}),
    terminationDate: Date.fromJson(json["termination_date"] ?? {"date": "1970-01-01", "formatted": "Thu Jan 01, 1970"}),
//        depreciation: json["depreciation"],
//        purchaseCost: json["purchase_cost"],
//        purchaseCostNumeric: json["purchase_cost_numeric"],
    notes: json["notes"] ?? '',
    expirationDate: Date.fromJson(json["expiration_date"] ?? {"date": "1970-01-01", "formatted": "Thu Jan 01, 1970"}),
//        seats: json["seats"],
//        freeSeatsCount: json["free_seats_count"],
//        minAmt: json["min_amt"],
    licenseName: json["license_name"] ?? '',
    licenseEmail: json["license_email"] ?? '',
//        reassignable: json["reassignable"],
//        maintained: json["maintained"],
//        supplier: Category.fromJson(json["supplier"]),
    category: Category.fromJson(json["category"] ?? {"id": -1, "name": ""}),
//        createdAt: AtedAt.fromJson(json["created_at"]),
//        updatedAt: AtedAt.fromJson(json["updated_at"]),
//        deletedAt: json["deleted_at"],
//        userCanCheckout: json["user_can_checkout"],
//        availableActions: AvailableActions.fromJson(json["available_actions"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "company": company,
    "manufacturer": manufacturer?.toJson(),
    "product_key": productKey,
//        "order_number": orderNumber,
//        "purchase_order": purchaseOrder,
    "purchase_date": purchaseDate?.toJson(),
    "termination_date": terminationDate?.toJson(),
//        "depreciation": depreciation,
//        "purchase_cost": purchaseCost,
//        "purchase_cost_numeric": purchaseCostNumeric,
    "notes": notes,
    "expiration_date": expirationDate?.toJson(),
//        "seats": seats,
//        "free_seats_count": freeSeatsCount,
//        "min_amt": minAmt,
    "license_name": licenseName,
    "license_email": licenseEmail,
//        "reassignable": reassignable,
//        "maintained": maintained,
//        "supplier": supplier?.toJson(),
    "category": category?.toJson(),
//        "created_at": createdAt?.toJson(),
//        "updated_at": updatedAt?.toJson(),
//        "deleted_at": deletedAt,
//        "user_can_checkout": userCanCheckout,
//        "available_actions": availableActions?.toJson(),
  };
}



// ..........................................
// ..........................................

class Date {
  final DateTime date;
  final String formatted;

  Date({
    required this.date,
    required this.formatted,
  });

  factory Date.fromJson(Map<String, dynamic> json) => Date(
    date: DateTime.parse(json["date"]),
    formatted: json["formatted"],
  );

  Map<String, dynamic> toJson() => {
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "formatted": formatted,
  };
}
