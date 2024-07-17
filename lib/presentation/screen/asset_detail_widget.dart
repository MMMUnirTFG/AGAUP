import 'package:flutter/material.dart';
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:second_blood/model/app_tags.dart";
import "package:second_blood/model/asset.dart";

// ...............................................

class AssetDetailScreen extends StatefulWidget {
  final Asset? asset;

  const AssetDetailScreen({super.key, required this.asset});

  @override
  State<AssetDetailScreen> createState() => _AssetDetailScreenState();
}



class _AssetDetailScreenState extends State<AssetDetailScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppTag.userAssetDetail, style: TextStyle(color: Colors.white)),
      ),
      //
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
          ClipOval(
            child: FadeInImage(
              width: 60,
              height: 60,
              fit: BoxFit.cover,
              image:NetworkImage('${widget.asset?.image}'),
              placeholder: const AssetImage(AppTag.assetImageDefault),
              imageErrorBuilder:(context, error, stackTrace) {
                return Image.asset(AppTag.assetImageDefault);
              },
            ),
          ),
          //
          title: Text(AppTag.assetTitle(widget.asset?.model?.name, widget.asset?.serial)),
          subtitle: Text(AppTag.assetSubtitle(widget.asset?.location?.name)),
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

    tiles.add(
        headerCard()
    );

    tiles.add(const SizedBox(height: 16.0));
    tiles.add(const Divider(height: 0));

    // Nombre
    tiles.add(
        _tiles(const FaIcon(FontAwesomeIcons.gun), AppTag.assetModelName, widget.asset?.model?.name, '')
    );

    tiles.add(const Divider(height: 0));

    // Código del modelo
    tiles.add(
        _tiles(const FaIcon(FontAwesomeIcons.ticket), AppTag.assetModelNumber, widget.asset?.modelNumber, '')
    );

    tiles.add(const Divider(height: 0));

    // Número de serie
    tiles.add(
        _tiles(const FaIcon(FontAwesomeIcons.creditCard), AppTag.assetSerial, widget.asset?.serial, '')
    );

    tiles.add(const Divider(height: 0));

    // Categoría
    tiles.add(
        _tiles(const FaIcon(FontAwesomeIcons.list), AppTag.assetCategory, '${widget.asset?.category?.name}', '')
    );

    tiles.add(const Divider(height: 0));

    // Taquilla
    tiles.add(
        _tiles(const FaIcon(FontAwesomeIcons.buildingLock), AppTag.assetLocation, '${widget.asset?.location?.name}', '')
    );

    tiles.add(const Divider(height: 0));

    // Código de referencia
    tiles.add(
        _tiles(const FaIcon(FontAwesomeIcons.barcode), AppTag.assetTag, '${widget.asset?.assetTag}', '')
    );

    tiles.add(const Divider(height: 0));

    // Disponibilidad
    tiles.add(
        _tiles(const FaIcon(FontAwesomeIcons.personWalkingLuggage), AppTag.assetStatusLabel, widget.asset?.statusLabel?.name, '')
    );

    tiles.add(const Divider(height: 0));

    // Antigüedad
    tiles.add(
        _tiles(const FaIcon(FontAwesomeIcons.hourglassHalf), AppTag.assetAge, widget.asset?.age, '')
    );

    tiles.add(const Divider(height: 0));

    // Datos adicionales
    tiles.add(
        _tiles(const FaIcon(FontAwesomeIcons.solidNoteSticky), AppTag.assetNotes, '${widget.asset?.notes}', '')
    );

    tiles.add(const SizedBox(height: 16.0));
    tiles.add(const Divider(height: 0));

    return tiles;
  }

}  // Fin de la clase
