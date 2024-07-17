import 'package:flutter/material.dart';
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:second_blood/model/app_tags.dart";
import "package:second_blood/model/accessory.dart";

// ...............................................

class AccessoryDetailScreen extends StatefulWidget {
  final Accessory? accessory;

  const AccessoryDetailScreen({super.key, required this.accessory});

  @override
  State<AccessoryDetailScreen> createState() => _AccessoryDetailScreenState();
}



class _AccessoryDetailScreenState extends State<AccessoryDetailScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppTag.userAccessoryDetail, style: TextStyle(color: Colors.white)),
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
          leading:
          ClipOval(child: FadeInImage(
            width: 60,
            height: 60,
            fit: BoxFit.cover,
            image:NetworkImage('${widget.accessory?.image}'),
            placeholder: const AssetImage(AppTag.accessoryImageDefault),
            imageErrorBuilder:(context, error, stackTrace) {
              return Image.asset(AppTag.accessoryImageDefault,
              );
            },
          ),
          ),
          //
          title: Text(AppTag.accessoryTitle(widget.accessory?.name, widget.accessory?.modelNumber)),
          subtitle: Text(AppTag.accessorySubtitle(widget.accessory?.location?.name)),
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

    // Cabecera del accesorio
    tiles.add(
        headerCard()
    );

    tiles.add(const SizedBox(height: 16.0));
    tiles.add(const Divider(height: 0));

    // Nombre
    tiles.add(
        _tiles(const FaIcon(FontAwesomeIcons.handcuffs), AppTag.accessoryName, widget.accessory?.name, '')
    );

    tiles.add(const Divider(height: 0));

    // Número de referencia
    tiles.add(
        _tiles(const FaIcon(FontAwesomeIcons.ticket), AppTag.accessoryModelNumber, widget.accessory?.modelNumber, '')
    );

    tiles.add(const Divider(height: 0));

    // Categoría
    tiles.add(
        _tiles(const FaIcon(FontAwesomeIcons.list), AppTag.accessoryCategory, '${widget.accessory?.category?.name}', '')
    );

    tiles.add(const Divider(height: 0));

    // Taquilla
    tiles.add(
        _tiles(const FaIcon(FontAwesomeIcons.buildingLock), AppTag.accessoryLocation, '${widget.accessory?.location?.name}', '')
    );

    tiles.add(const Divider(height: 0));

    // Productor
    tiles.add(
        _tiles(const FaIcon(FontAwesomeIcons.industry), AppTag.accessoryManufacturer, '${widget.accessory?.manufacturer?.name}', '')
    );

    tiles.add(const Divider(height: 0));

    // Proveedor
    tiles.add(
        _tiles(const FaIcon(FontAwesomeIcons.truckField), AppTag.accessorySupplier, widget.accessory?.supplier?.name, '')
    );

    tiles.add(const Divider(height: 0));

    // Datos adicionales
    tiles.add(
        _tiles(const FaIcon(FontAwesomeIcons.solidNoteSticky), AppTag.accessoryNotes,  '${widget.accessory?.notes}', '')
    );

    tiles.add(const SizedBox(height: 16.0));
    tiles.add(const Divider(height: 0));

    return tiles;
  }

}  // Fin de la clase
