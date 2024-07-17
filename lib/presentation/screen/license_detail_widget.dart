import 'package:flutter/material.dart';
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:second_blood/model/app_tags.dart";
import "package:second_blood/model/license.dart";

// ...............................................

class LicenseDetailScreen extends StatefulWidget {
  final License? license;

  const LicenseDetailScreen({super.key, required this.license});

  @override
  State<LicenseDetailScreen> createState() => _LicenseDetailScreenState();
}



class _LicenseDetailScreenState extends State<LicenseDetailScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppTag.userLicenseDetail, style: TextStyle(color: Colors.white)),
      ),

      body: getBody(context),
    );
  }


// .............    .............

  Widget getBody(BuildContext context) {

    return SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
            children: getTiles(context)
        )
    );
  }


// .............    .............

  Widget headerCard() {
    return Card(
        child: ListTile(
          leading:  CircleAvatar(
            backgroundColor: AppTag.appBarColor,
            radius: 20,
            child: Text('${widget.license?.id}', style: const TextStyle(color: Colors.white)),
          ),
          //
          title: Text(AppTag.licenseTitle(widget.license?.name, widget.license?.productKey)),
          subtitle: Text(AppTag.licenseSubtitle(widget.license?.category?.name)),
        )
    );
  }


// .............    .............

  Widget _tiles(Widget? leading, String? title, String? subtitle, String? trailing) {

    if (leading == null) {
      return ListTile(
        title: Text(title!),
        subtitle: Text(subtitle!, style: const TextStyle(color: Colors.black)),
        trailing: Text(trailing!),
      );
    }
    else {
      return ListTile(
        leading: leading,
        title: Text(title!),
        subtitle: Text(subtitle!, style: const TextStyle(color: Colors.black)),
        trailing: Text(trailing!),
      );
    }

  }


// .............    .............

  List<Widget> getTiles(BuildContext context) {
    List<Widget> tiles = [];

    // Cabecera del perfil
    tiles.add(
        headerCard()
    );

    tiles.add(const SizedBox(height: 16.0));
    tiles.add(const Divider(height: 0));

    // Nombre
    tiles.add(
        _tiles(const FaIcon(FontAwesomeIcons.newspaper), AppTag.licenseName, widget.license?.name, '')
    );

    tiles.add(const Divider(height: 0));

    // Tipo
    tiles.add(
        _tiles(const FaIcon(FontAwesomeIcons.idCard), AppTag.licenseCategory, widget.license?.category?.name, '')
    );

    tiles.add(const Divider(height: 0));

    // Número de licencia
    tiles.add(
        _tiles(const FaIcon(FontAwesomeIcons.creditCard), AppTag.licenseKey, '${widget.license?.productKey}', '')
    );

    tiles.add(const Divider(height: 0));

    // Entidad emisora
    tiles.add(
        _tiles(const FaIcon(FontAwesomeIcons.buildingColumns), AppTag.licenseManufacturer, '${widget.license?.manufacturer?.name}', '')
    );

    tiles.add(const Divider(height: 0));

    // Fecha de expedición
    tiles.add(
        _tiles(const FaIcon(FontAwesomeIcons.hourglassStart), AppTag.licenseExpeditionDate, '${widget.license?.purchaseDate?.date}', '')
    );

    tiles.add(const Divider(height: 0));

    // Fecha de caducidad
    tiles.add(
        _tiles(const FaIcon(FontAwesomeIcons.hourglassEnd), AppTag.licenseExpirationDate, '${widget.license?.expirationDate?.date}', '')
    );

    tiles.add(const Divider(height: 0));

    // Datos adicionales
    tiles.add(
        _tiles(const FaIcon(FontAwesomeIcons.solidNoteSticky), AppTag.licenseNotes,  '${widget.license?.notes}', '')
    );

    tiles.add(const SizedBox(height: 16.0));
    tiles.add(const Divider(height: 0));

    return tiles;
  }

}  // Fin de la clase
