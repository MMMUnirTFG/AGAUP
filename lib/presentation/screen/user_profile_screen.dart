import "package:second_blood/model/app_tags.dart";
import 'package:flutter/material.dart';
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:second_blood/model/user_profile.dart";

// ...............................................

class UserProfileScreen extends StatefulWidget {
  final UserProfile? userProfile;

  const UserProfileScreen({super.key, required this.userProfile});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}



class _UserProfileScreenState extends State<UserProfileScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppTag.userProfile, style: TextStyle(color: Colors.white)),
      ),
      //
      body: getBody(context),
    );
  }


  // .......................     .......................

  Widget getBody(BuildContext context) {

    return SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
            children: getTiles(context)
        )
    );
  }


  // .......................     .......................

  Widget headerCard() {
    return Card(
        child: ListTile(
          title: Text('${widget.userProfile?.name}', style: const TextStyle(color: Colors.black)),
          subtitle: Text('${widget.userProfile?.username}'),
          leading:
          ClipOval(child: FadeInImage(
            width: 60,
            height: 60,
            fit: BoxFit.cover,
            image:NetworkImage('${widget.userProfile?.avatar}'),
            placeholder: const AssetImage(AppTag.userImageDefault),
            imageErrorBuilder:(context, error, stackTrace) {
              return Image.asset(AppTag.userImageDefault,
              );
            },
          ),
          ),
          trailing: Text('${widget.userProfile?.jobtitle}',
              style: const TextStyle(fontSize: 10, color: Colors.black)
          ),
        )
    );
  }


  // .......................     .......................

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



  // .......................     .......................

  List<Widget> getTiles(BuildContext context) {
    List<Widget> tiles = [];

    // Cabecera del perfil (foto, nombre, username, categoría profesional)
    tiles.add(
        headerCard()
    );

    tiles.add(const SizedBox(height: 16.0));
    tiles.add(const Divider(height: 3));
    tiles.add(const SizedBox(height: 3.0));
    tiles.add(const Divider(height: 3));

    // Número de identificación
    tiles.add(
        _tiles(const FaIcon(FontAwesomeIcons.idCard), AppTag.userEmployeeNum, widget.userProfile?.employeeNum, '')
    );

    tiles.add(const Divider(height: 0));

    // Categoría profesional
    tiles.add(
        _tiles(const FaIcon(FontAwesomeIcons.solidUser), AppTag.userJobtitle, widget.userProfile?.jobtitle, '')
    );

    tiles.add(const Divider(height: 3));
    tiles.add(const SizedBox(height: 3.0));
    tiles.add(const Divider(height: 3));

    // Departamento
    tiles.add(
        _tiles(const FaIcon(FontAwesomeIcons.buildingUser), AppTag.userDepartment, widget.userProfile?.department?.name, '')
    );

    tiles.add(const Divider(height: 0));

    // Unidad
    tiles.add(
        _tiles(const FaIcon(FontAwesomeIcons.personMilitaryPointing), AppTag.userCompany, '${widget.userProfile?.company?.name}', '')
    );

    tiles.add(const Divider(height: 0));
    tiles.add(const Divider(height: 0));

    // Teléfono
    tiles.add(
        _tiles(const FaIcon(FontAwesomeIcons.phone), AppTag.userPhone, widget.userProfile?.phone, '')
    );

    tiles.add(const Divider(height: 0));

    // Correo electrónico
    tiles.add(
        _tiles(const FaIcon(FontAwesomeIcons.at), AppTag.userEmail, widget.userProfile?.email, '')
    );

    tiles.add(const Divider(height: 3));
    tiles.add(const SizedBox(height: 3.0));
    tiles.add(const Divider(height: 3));


    // Dirección de contacto
    String direccion = '${widget.userProfile?.address}, ${widget.userProfile?.city}. ${widget.userProfile?.zip},  ${widget.userProfile?.state}.';

    tiles.add(
        _tiles(const FaIcon(FontAwesomeIcons.mapLocationDot), AppTag.userFullAddress, direccion, '')
    );

    tiles.add(const Divider(height: 0));

    // Datos adicionales
    tiles.add(
        _tiles(const FaIcon(FontAwesomeIcons.solidNoteSticky), AppTag.userNotes, widget.userProfile?.notes, '')
    );

    tiles.add(const SizedBox(height: 16.0));
    tiles.add(const Divider(height: 0));

    return tiles;
  }

}  // Fin de la clase
