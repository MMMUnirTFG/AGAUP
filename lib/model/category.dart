
// ......................................................
// Clase generada por quicktype.io en las distintas llamadas a la REST API SnipeIT.
// Dado que se repetía en muchos ficheros generados automáticamente por quicktype.io
// se creó una única clase y que todos los ficheros referenciaran a esta única definición de 
// CATEGORY
// ......................................................

class Category {
  final int? id;
  final String? name;

  Category({
    this.id,
    this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
