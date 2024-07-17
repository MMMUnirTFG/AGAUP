// ......................................................
// Clase que almacena la información más relevante de la munición de la armería 
// Permite saber si esa munición ha sido seleccionada por el usuario de la aplicación (isChecked)
// ......................................................

class Ammo {
  int? id;
  String? name;
  String? itemNo;
  String? category;
  String? image;

  bool isChecked;
  Ammo(this.id, this.name, this.itemNo, this.category, this.image, {this.isChecked = false});
}
