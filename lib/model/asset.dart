import 'package:second_blood/model/category.dart';

// ......................................................
// Código generado por https://quicktype.io/ a partir de la llamada a la REST API de SnipeIT: '$serverUrl/users/$userId/assets';
// Asset es un elemento de la lista obtenida en la llamada a la REST API de SnipeIT.
// ......................................................

class Asset {
  final int? id;
  final String? name;
  final String? assetTag;
  final String? serial;
  final Category? model;
  final bool? byod;
  final bool? requestable;
  final String? modelNumber;
  final String? eol;
  final Date? assetEolDate;
  final StatusLabel? statusLabel;
  final Category? category;
  final dynamic manufacturer;
  final Category? supplier;
  final String? notes;
  final String? orderNumber;
  final dynamic company;
  final Category? location;
  final Category? rtdLocation;
  final String? image;
  final String? qr;
  final String? altBarcode;
  //final dynamic assignedTo;
  //final dynamic warrantyMonths;
  //final dynamic warrantyExpires;
  //final AtedAt? createdAt;
  //final AtedAt? updatedAt;
  //final dynamic lastAuditDate;
  //final dynamic nextAuditDate;
  //final dynamic deletedAt;
  final Date? purchaseDate;
  final String? age;
  //final dynamic lastCheckout;
  //final dynamic lastCheckin;
  //final dynamic expectedCheckin;
  //final String? purchaseCost;
  //final int? checkinCounter;
  //final int? checkoutCounter;
  //final int? requestsCounter;
  //final bool? userCanCheckout;
  //final String? bookValue;
  //final CustomFields? customFields;
  //final AvailableActions? availableActions;

  Asset({
    this.id,
    this.name,
    this.assetTag,
    this.serial,
    this.model,
    this.byod,
    this.requestable,
    this.modelNumber,
    this.eol,
    this.assetEolDate,
    this.statusLabel,
    this.category,
    this.manufacturer,
    this.supplier,
    this.notes,
    this.orderNumber,
    this.company,
    this.location,
    this.rtdLocation,
    this.image,
    this.qr,
    this.altBarcode,
    //this.assignedTo,
    //this.warrantyMonths,
    //this.warrantyExpires,
    //this.createdAt,
    //this.updatedAt,
    //this.lastAuditDate,
    //this.nextAuditDate,
    //this.deletedAt,
    this.purchaseDate,
    this.age,
    //this.lastCheckout,
    //this.lastCheckin,
    //this.expectedCheckin,
    //this.purchaseCost,
    //this.checkinCounter,
    //this.checkoutCounter,
    //this.requestsCounter,
    //this.userCanCheckout,
    //this.bookValue,
    //this.customFields,
    //this.availableActions,
  });

  factory Asset.fromJson(Map<String, dynamic> json) => Asset(
    id: json["id"] ?? -1,
    name: json["name"] ?? '',
    assetTag: json["asset_tag"] ?? '',
    serial: json["serial"] ?? '',
    model: Category.fromJson(json["model"] ?? {"id": -1, "name": ""}),
    byod: json["byod"] ?? true,
    requestable: json["requestable"] ?? true,
    modelNumber: json["model_number"] ?? '',
    eol: json["eol"] ?? '',
    assetEolDate: Date.fromJson(json["asset_eol_date"] ?? {"date": "1970-01-01", "formatted": "Thu Jan 01, 1970"}),
    statusLabel: StatusLabel.fromJson(json["status_label"] ?? {"id": -1, "name": "", "status_type": "", "status_meta": ""}),
    category: Category.fromJson(json["category"] ?? {"id": -1, "name": ""}),
    manufacturer: json["manufacturer"] ?? '',
    supplier: Category.fromJson(json["supplier"] ?? {"id": -1, "name": ""}),
    notes: json["notes"] ?? '',
    orderNumber: json["order_number"] ?? '',
    company: json["company"] ?? '',
    location: Category.fromJson(json["location"] ?? {"id": -1, "name": ""}),
    rtdLocation: Category.fromJson(json["rtd_location"] ?? {"id": -1, "name": ""}),
    image: json["image"] ?? '',
    qr: json["qr"] ?? '',
    altBarcode: json["alt_barcode"] ?? '',
    //assignedTo: json["assigned_to"],
    //warrantyMonths: json["warranty_months"],
    //warrantyExpires: json["warranty_expires"],
    //createdAt: AtedAt.fromJson(json["created_at"]),
    //updatedAt: AtedAt.fromJson(json["updated_at"]),
    //lastAuditDate: json["last_audit_date"],
    //nextAuditDate: json["next_audit_date"],
    //deletedAt: json["deleted_at"],
    purchaseDate: Date.fromJson(json["purchase_date"] ?? {"date": "1970-01-01", "formatted": "Thu Jan 01, 1970"}),
    age: json["age"] ?? '',
    //lastCheckout: json["last_checkout"],
    //lastCheckin: json["last_checkin"],
    //expectedCheckin: json["expected_checkin"],
    //purchaseCost: json["purchase_cost"],
    //checkinCounter: json["checkin_counter"],
    //checkoutCounter: json["checkout_counter"],
    //requestsCounter: json["requests_counter"],
    //userCanCheckout: json["user_can_checkout"],
    //bookValue: json["book_value"],
    //customFields: CustomFields.fromJson(json["custom_fields"]),
    //availableActions: AvailableActions.fromJson(json["available_actions"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "asset_tag": assetTag,
    "serial": serial,
    "model": model?.toJson(),
    "byod": byod,
    "requestable": requestable,
    "model_number": modelNumber,
    "eol": eol,
    "asset_eol_date": assetEolDate?.toJson(),
    "status_label": statusLabel?.toJson(),
    "category": category?.toJson(),
    "manufacturer": manufacturer,
    "supplier": supplier?.toJson(),
    "notes": notes,
    "order_number": orderNumber,
    "company": company,
    "location": location?.toJson(),
    "rtd_location": rtdLocation?.toJson(),
    "image": image,
    "qr": qr,
    "alt_barcode": altBarcode,
    //"assigned_to": assignedTo,
    //"warranty_months": warrantyMonths,
    //"warranty_expires": warrantyExpires,
    //"created_at": createdAt?.toJson(),
    //"updated_at": updatedAt?.toJson(),
    //"last_audit_date": lastAuditDate,
    //"next_audit_date": nextAuditDate,
    //"deleted_at": deletedAt,
    "purchase_date": purchaseDate?.toJson(),
    "age": age,
    //"last_checkout": lastCheckout,
    //"last_checkin": lastCheckin,
    //"expected_checkin": expectedCheckin,
    //"purchase_cost": purchaseCost,
    //"checkin_counter": checkinCounter,
    //"checkout_counter": checkoutCounter,
    //"requests_counter": requestsCounter,
    //"user_can_checkout": userCanCheckout,
    //"book_value": bookValue,
    //"custom_fields": customFields?.toJson(),
    //"available_actions": availableActions?.toJson(),
  };
}



// -------------------------------

class Date {
  final DateTime? date;
  final String? formatted;

  Date({
    this.date,
    this.formatted,
  });

  factory Date.fromJson(Map<String, dynamic> json) => Date(
    date: DateTime.parse(json["date"]),
    formatted: json["formatted"],
  );

  Map<String, dynamic> toJson() => {
    "date": "${date?.year.toString().padLeft(4, '0')}-${date?.month.toString().padLeft(2, '0')}-${date?.day.toString().padLeft(2, '0')}",
    "formatted": formatted,
  };
}


// -------------------------------

enum Element {
  CHECKBOX,
  RADIO,
  TEXT
}

final elementValues = EnumValues({
  "checkbox": Element.CHECKBOX,
  "radio": Element.RADIO,
  "text": Element.TEXT
});

enum FieldFormat {
  ANY,
  REGEX_0915
}

final fieldFormatValues = EnumValues({
  "ANY": FieldFormat.ANY,
  "regex:/^[0-9]{15}\u0024/": FieldFormat.REGEX_0915
});

// -------------------------------

class StatusLabel {
  final int? id;
  final String? name;
  final String? statusType;
  final String? statusMeta;

  StatusLabel({
    this.id,
    this.name,
    this.statusType,
    this.statusMeta,
  });

  factory StatusLabel.fromJson(Map<String, dynamic> json) => StatusLabel(
    id: json["id"],
    name: json["name"],
    statusType: json["status_type"],
    statusMeta: json["status_meta"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "status_type": statusType,
    "status_meta": statusMeta,
  };
}

// -------------------------------

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
