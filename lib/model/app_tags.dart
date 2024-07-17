import 'package:flutter/material.dart';
import 'package:second_blood/model/ammo.dart';

class AppTag {
  // Constantes para la apariencia de la aplicación
  static const String appTitle = 'Armeria App';
  static const Color  appBarColor = Color.fromARGB(255, 193, 27, 61); // Colors.blue; //
  static const Color  backgroundColor = Color.fromARGB(255, 216, 217, 217);
  static const Color  buttonColor = Color.fromARGB(255, 101, 46, 196);

  static const String notes = 'Datos adicionales';

  // Contantes para el texto de la página de inicio
  static const String initSesion = 'Inicio de sesión';
  static const String userName = 'Correo electrónico'; //Nombre de usuario';
  static const String password = 'Contraseña';
  static const String forgotPassword = '¿Olvidaste la constraseña?';
  static const String accessButton = 'Acceder';

  // Contantes para el texto de la página de recuperar contraseña
  static const String recuperarPassword = 'Resetear la contraseña';
  static const String recuperarButton = 'Enviar correo';

  // Contantes para el texto de la página principal (HOME)
  static const String solicitarMunicionButton = 'Solicitar munición';
     // Referencia del AVATAR (userImageDefault): <a href="https://www.flaticon.com/free-icons/user" title="user icons">User icons created by Smashicons - Flaticon</a>
  static const String userImageDefault = 'images/user.png';
  static const String userProfile = 'Mi perfil';
  static const String userAssets = 'Mis armas';
  static const String userLicenses = 'Mis permisos de armas';
  static const String userAccessories = 'Mis accesorios';
  static const String getUserProfileException = 'Fallo en la carga de los datos del usuario (GET)';

  // Contantes para el texto de la página 'USER_PROFILE'
  static const String userEmployeeNum = 'Número de identificación';
  static const String userJobtitle = 'Categoría profesional';
  static const String userDepartment = 'Departamento';
  static const String userCompany = 'Unidad';
  static const String userPhone = 'Teléfono';
  static const String userEmail = 'Correo electrónico';
  static const String userFullAddress = 'Dirección de contacto';
  static const String userNotes = notes;

  // Contantes para el texto de la página 'USER_ASSET_LIST'
  static const String assetNoAssetMsg = 'Este usuario no tiene armas registradas.';
    // Referencia del GUN (assetImageDefault): <a href="https://www.flaticon.com/free-icons/pistol" title="pistol icons">Pistol icons created by Vector Stall - Flaticon</a>
  static const String assetImageDefault = 'images/pistol.png';
  static const String getAssetListException = 'Fallo en la carga de los datos de las armas del usuario (GET)';

  static String assetTitle(String? assetModel, String? assetSerial) {
    return 'Arma $assetModel (ref.:$assetSerial)';
  }

  static String assetSubtitle(String? assetLocation) {
    return 'Taquilla: $assetLocation';
  }

  // Contantes para el texto de la página 'USER_ASSET_DETAIL'
  static const String userAssetDetail = 'Ver arma';
  static const String assetModelName = 'Modelo';
  static const String assetModelNumber = 'Código del modelo';
  static const String assetSerial = 'Número de serie';
  static const String assetCategory = 'Categoría';
  static const String assetLocation = 'Taquilla';
  static const String assetTag = 'Código de referencia';
  static const String assetStatusLabel = 'Disponibilidad';
  static const String assetAge = 'Antigüedad';
  static const String assetNotes = notes;

  // Contantes para el texto de la página 'USER_LICENSE_LIST'
  static const String licenseNoLicenseMsg = 'Este usuario no tiene ningún permiso de armas registrado.';
  static const String getLicenseListException = 'Fallo en la carga de los datos de los permisos de armas del usuario (GET)';

  static String licenseTitle(String? licenseName, String? licenseKey) {
    return 'Licencia $licenseName (código.:$licenseKey)';
  }

  static String licenseSubtitle(String? licenseCategory) {
    return 'Categoría: $licenseCategory';
  }

  // Contantes para el texto de la página 'USER_LICENSE_DETAIL'
  static const String userLicenseDetail = 'Ver permiso de arma';
  static const String licenseName = 'Nombre';
  static const String licenseCategory = 'Tipo';
  static const String licenseKey = 'Número de licencia';
  static const String licenseManufacturer = 'Entidad emisora';
  static const String licenseExpeditionDate = 'Fecha de expedición';
  static const String licenseExpirationDate = 'Fecha de caducidad';
  static const String licenseNotes = notes;


  // Contantes para el texto de la página 'USER_ACCESSORY_LIST'
  static const String accessoryNoAccessoryMsg = 'Este usuario no tiene accesorios registrados.';
  static const String accessoryImageDefault = 'images/police-handcuffs.png';
  static const String getAccessoriesListException = 'Fallo en la carga de los datos de los accesorios del usuario (GET)';

  static String accessoryTitle(String? accessoryName, String? accessoryModelNumber) {
    return 'Accesorio $accessoryName (ref.:$accessoryModelNumber)';
  }

  static String accessorySubtitle(String? accessoryLocation) {
    return 'Ubicación: $accessoryLocation';
  }

  // Contantes para el texto de la página 'USER_ACCESSORY_DETAIL'
  static const String userAccessoryDetail = 'Ver accesorio';
  static const String accessoryName = 'Nombre';
  static const String accessoryModelNumber = 'Número de referencia';
  static const String accessoryCategory = 'Categoría';
  static const String accessoryLocation = 'Taquilla';
  static const String accessoryManufacturer = 'Productor';
  static const String accessorySupplier = 'Proveedor';
  static const String accessoryNotes = notes;

  // Contantes para el texto de la página 'CONSUMABLE_STOCK'
  static const String stockCaption = 'Stock de munición';
  static const String sendButton = 'Enviar solicitud';

  static const String stockNoStockMsg = 'No hay munición disponible.';

  static String stockTitle(String? ammoName, String? ammoItemNo) {
    return 'Munición $ammoName (código.:$ammoItemNo)';
  }

  static String stockSubtitle(String? ammoCategory) {
    return 'Categoría: $ammoCategory';
  }

  // Contantes para el texto del correo de la petición de MUNICIÓN.
  static const String subjectMail = 'Solicitud de material fungible...';
  static const String recipientsMail = 'noreplytesting891@gmail.com';


  static String bodyMail(String? userName, String? userJobtitle, String? userDepartment, String? userUnit, List<Ammo> checkboxList, ) {

    String body = '';
    body = '$body Estimados señores,';
    body = '$body <p> </p>';

    body = '$body Me dirijo a ustedes en calidad de  $userJobtitle de $userDepartment (unidad $userUnit).';
    body = '$body <p> </p>';
    body = '$body En vista de nuestras necesidades operativas, solicito el suministro de la siguiente munición:';
    body = '$body <br>';

    for (final municion in checkboxList) {

      if (municion.isChecked) {
        body = '$body -Categoría: ${municion.category}. Tipo de munición ${municion.name} (código.:${municion.itemNo}) <br>';
      }
    }

    body = '$body <p> </p> <br>';
    body = '$body Atentamente,';
    body = '$body <p> </p> <br>';
    body = '$body $userName';

    return body;
  }

}
