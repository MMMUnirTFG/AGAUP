import 'dart:async';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:second_blood/api.dart';
import 'package:second_blood/model/app_tags.dart';
import 'package:second_blood/model/user_profile.dart';
import 'package:second_blood/presentation/screen/login_screen.dart';
import 'package:second_blood/presentation/screen/user_profile_screen.dart';
import 'package:second_blood/presentation/screen/asset_list_screen.dart';
import 'package:second_blood/presentation/screen/license_list_screen.dart';
import 'package:second_blood/presentation/screen/accessory_list_screen.dart';
import 'package:second_blood/presentation/screen/consumable_stock_screen.dart';

// ...............................................

class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}



class _HomeScreenState extends State<HomeScreen> {

  late Future<UserProfile> futureUserProfile;
  late UserProfile? tmpUserProfile;

  // Firebase auth 
  late User _user;

  @override
  void initState() {
    super.initState();
    _user = FirebaseAuth.instance.currentUser!;
    futureUserProfile = fetchUserProfile();
  }


// .............    .............

Future<void> logout() async {
  await FirebaseAuth.instance.signOut();

  Navigator.push(
              // ignore: use_build_context_synchronously
              context,
              MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
              ),
  );
}


// .............    .............

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppTag.appTitle, style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
              icon: const FaIcon(FontAwesomeIcons.arrowRightFromBracket),
              onPressed: logout,
          ),
        ],
      ),
      body: getBody(context),
      //
      floatingActionButton: Builder(
        builder: (context) => FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ConsumableStockScreen(userProfile: tmpUserProfile)),
            );
          },
          label: const Text(AppTag.solicitarMunicionButton),
          icon: const Icon(Icons.add),
        ),
      ),
    );
  }


// .............    .............

  Widget _TextField(String labelText, String? hintText) {
    return Container(
        padding: const EdgeInsets.all(8),
        child:
        TextField(
          style: const TextStyle(color: Colors.black),
          readOnly: true,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: labelText, // Cabecera del campo de texto
            hintText: hintText,   // Contenido del campo de texto
            floatingLabelBehavior: FloatingLabelBehavior.always,
          ),
        )
    );
  }


// .............    .............

  Widget components(BuildContext context, UserProfile? data) {

    var imgProfile = data?.avatar;
    tmpUserProfile = data;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form (
        child: Column(
          children: [
            InkWell(
                child:
                ClipOval(child: FadeInImage(
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                  image:NetworkImage(imgProfile!),
                  placeholder: const AssetImage(AppTag.userImageDefault),
                  imageErrorBuilder:(context, error, stackTrace) {
                    return Image.asset(AppTag.userImageDefault,
                      fit: BoxFit.cover,
                      width: 200,
                      height: 200,
                    );
                  },
                ),
                )
            ),
            const SizedBox(height: 16.0),
            _TextField(AppTag.userName, data?.name),
            const SizedBox(height: 16.0),
            _card(
              context,
              FontAwesomeIcons.solidUser,
              AppTag.userProfile,
              UserProfileScreen(userProfile: data),
            ),
            const SizedBox(height: 10.0),
            _card(
              context,
              FontAwesomeIcons.gun,
              AppTag.userAssets,
              AssetListScreen(userId: data?.id),
            ),
            const SizedBox(height: 10.0),
            _card(
              context,
              FontAwesomeIcons.idCard,
              AppTag.userLicenses,
              LicenseListScreen(userId: data?.id),
            ),
            const SizedBox(height: 10.0),
            _card(
              context,
              FontAwesomeIcons.handcuffs,
              AppTag.userAccessories,
              AccessoriesListScreen(userId: data?.id),
            ),
          ],
        ),
      ),
    );
  }


// .............    .............

  Widget getBody(BuildContext context) {
    return Center(
      child: FutureBuilder<UserProfile>(
        future: futureUserProfile,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return components(context, snapshot.data);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }


// .............    .............

  Future<UserProfile> fetchUserProfile() async {

    final url = Api.urlUsersMe();
    final dio = Api.createDio(baseUrl: url, trustSelfSigned: true );

    final response = await dio.get(
      url,
      options: Options(
        headers: { 'authorization': 'Bearer ${Api.authorizationBearerKey}', },
      ),
    );

    if (response.statusCode == 200) {
      return UserProfile.fromJson(response.data as Map<String, dynamic>);
    } else {
      throw Exception(AppTag.getUserProfileException);
    }
  }


// .............    .............

  Widget _card(BuildContext context, IconData icon, String label, dynamic nextPage, [Widget? trailing]) {

    return GestureDetector(
      child: Card(
        margin: const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 12
        ),
        child: ListTile(
          leading: FaIcon(icon),
          title: Text(label),
          trailing: trailing,
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => nextPage,
          ),
        );
      },
    );
  }

}
