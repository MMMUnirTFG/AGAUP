import 'dart:convert';

// ......................................................
// Código generado por https://quicktype.io/ a partir de la llamada a la REST API de SnipeIT: '$serverUrl/users/me';
// ......................................................

UserProfile userFromJson(String str) => UserProfile.fromJson(json.decode(str));

String userToJson(UserProfile data) => json.encode(data.toJson());

class UserProfile {
  final int? id;
  final String? avatar;
  final String? name;
  final String? firstName;
  final String? lastName;
  final String? username;
//    final bool? remote;
//    final String? locale;
  final String? employeeNum;
//    final dynamic manager;
  final String? jobtitle;
//    final bool? vip;
  final String? phone;
//    final dynamic website;
  final String? address;
  final String? city;
  final String? state;
//    final String? country;
  final String? zip;
  final String? email;
  final Company? department;
//    final dynamic location;
  final String? notes;
//    final Permissions? permissions;
//    final bool? activated;
//    final bool? autoassignLicenses;
//    final bool? ldapImport;
//    final bool? twoFactorEnrolled;
//    final bool? twoFactorOptin;
//    final int? assetsCount;
//    final int? licensesCount;
//    final int? accessoriesCount;
//    final int? consumablesCount;
  final Company? company;
//    final dynamic createdBy;
//    final AtedAt? createdAt;
//    final AtedAt? updatedAt;
//    final dynamic startDate;
//    final dynamic endDate;
//    final dynamic lastLogin;
//    final dynamic deletedAt;
//    final AvailableActions? availableActions;
//    final dynamic groups;

  UserProfile({
    this.id,
    this.avatar,
    this.name,
    this.firstName,
    this.lastName,
    this.username,
//        this.remote,
//        this.locale,
    this.employeeNum,
//        this.manager,
    this.jobtitle,
//        this.vip,
    this.phone,
//        this.website,
    this.address,
    this.city,
    this.state,
//        this.country,
    this.zip,
    this.email,
    this.department,
//        this.location,
    this.notes,
//        this.permissions,
//        this.activated,
//        this.autoassignLicenses,
//        this.ldapImport,
//        this.twoFactorEnrolled,
//        this.twoFactorOptin,
//        this.assetsCount,
//        this.licensesCount,
//        this.accessoriesCount,
//        this.consumablesCount,
    this.company,
//        this.createdBy,
//        this.createdAt,
//        this.updatedAt,
//        this.startDate,
//        this.endDate,
//        this.lastLogin,
//        this.deletedAt,
//        this.availableActions,
//        this.groups,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
    id: json["id"] ?? -1,
    avatar: json["avatar"] ?? '',
    name: json["name"] ?? '',
    firstName: json["first_name"] ?? '',
    lastName: json["last_name"] ?? '',
    username: json["username"] ?? '',
//        remote: json["remote"],
//        locale: json["locale"],
    employeeNum: json["employee_num"] ?? '',
//        manager: json["manager"],
    jobtitle: json["jobtitle"] ?? '',
//        vip: json["vip"],
    phone: json["phone"] ?? '',
//        website: json["website"],
    address: json["address"] ?? '',
    city: json["city"] ?? '',
    state: json["state"] ?? '',
//        country: json["country"],
    zip: json["zip"] ?? '',
    email: json["email"] ?? '',
    department: Company.fromJson(json["department"] ?? {"id": -1, "name": ""}),
//        location: json["location"],
    notes: json["notes"] ?? '',
//        permissions: Permissions.fromJson(json["permissions"]),
//        activated: json["activated"],
//        autoassignLicenses: json["autoassign_licenses"],
//        ldapImport: json["ldap_import"],
//        twoFactorEnrolled: json["two_factor_enrolled"],
//        twoFactorOptin: json["two_factor_optin"],
//        assetsCount: json["assets_count"],
//        licensesCount: json["licenses_count"],
//        accessoriesCount: json["accessories_count"],
//        consumablesCount: json["consumables_count"],
    company: Company.fromJson(json["company"] ?? {"id": -1, "name": ""}),
//        createdBy: json["created_by"],
//        createdAt: AtedAt.fromJson(json["created_at"]),
//        updatedAt: AtedAt.fromJson(json["updated_at"]),
//        startDate: json["start_date"],
//        endDate: json["end_date"],
//        lastLogin: json["last_login"],
//        deletedAt: json["deleted_at"],
//        availableActions: AvailableActions.fromJson(json["available_actions"]),
//        groups: json["groups"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "avatar": avatar,
    "name": name,
    "first_name": firstName,
    "last_name": lastName,
    "username": username,
//        "remote": remote,
//        "locale": locale,
    "employee_num": employeeNum,
//        "manager": manager,
    "jobtitle": jobtitle,
//        "vip": vip,
    "phone": phone,
//        "website": website,
    "address": address,
    "city": city,
    "state": state,
//        "country": country,
    "zip": zip,
    "email": email,
    "department": department?.toJson(),
//        "location": location,
    "notes": notes,
//        "permissions": permissions?.toJson(),
//        "activated": activated,
//        "autoassign_licenses": autoassignLicenses,
//        "ldap_import": ldapImport,
//        "two_factor_enrolled": twoFactorEnrolled,
//        "two_factor_optin": twoFactorOptin,
//        "assets_count": assetsCount,
//        "licenses_count": licensesCount,
//        "accessories_count": accessoriesCount,
//        "consumables_count": consumablesCount,
    "company": company?.toJson(),
//        "created_by": createdBy,
//        "created_at": createdAt?.toJson(),
//        "updated_at": updatedAt?.toJson(),
//        "start_date": startDate,
//        "end_date": endDate,
//        "last_login": lastLogin,
//        "deleted_at": deletedAt,
//        "available_actions": availableActions?.toJson(),
//        "groups": groups,
  };
}



// ..........................................
// ..........................................

class Company {
  final int id;
  final String name;

  Company({
    required this.id,
    required this.name,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
    id: json["id"] ?? -1,
    name: json["name"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
