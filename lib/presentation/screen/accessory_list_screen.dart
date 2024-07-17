import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:second_blood/api.dart';
import 'package:second_blood/model/app_tags.dart';
import 'package:second_blood/model/accessories_list.dart';
import 'package:second_blood/presentation/screen/accessory_detail_widget.dart';

// ...............................................

class AccessoriesListScreen extends StatefulWidget {
  final int? userId;
  final AccessoriesList? accessoriesList;

  const AccessoriesListScreen({super.key, required this.userId, this.accessoriesList});

  @override
  State<AccessoriesListScreen> createState() => _AccessoriesListScreenState();
}



class _AccessoriesListScreenState extends State<AccessoriesListScreen> {
  late Future<AccessoriesList> futureAccessoriesList;

  @override
  void initState() {
    super.initState();
    futureAccessoriesList = fetchAccessoriesList();
  }


// .............    .............

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppTag.userAccessories, style: TextStyle(color: Colors.white)),
      ),
      body: getBody(context),
    );
  }


// .............    .............

  Widget getBody(BuildContext context) {
    return Center(
      child: FutureBuilder<AccessoriesList>(
        future: futureAccessoriesList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data?.total == 0) {
              return const Text(AppTag.accessoryNoAccessoryMsg);
            }
            else {
              return getLAccessoriesList(snapshot.data as AccessoriesList);
            }

          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          return const CircularProgressIndicator();
        },
      ),
    );
  }


// .............    .............

  Widget getLAccessoriesList(AccessoriesList data) {

    return ListView.builder(
        itemCount: data.total,
        itemBuilder: (BuildContext context, int index) {

          if (data.total == 0) {
            return const Text(AppTag.accessoryNoAccessoryMsg);
          }

          final accessory = data.accessories[index];

          return Card(
              child: ListTile(
                leading:
                ClipOval(child: FadeInImage(
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                  image:NetworkImage('${accessory.image}'),
                  placeholder: const AssetImage(AppTag.accessoryImageDefault),
                  imageErrorBuilder:(context, error, stackTrace) {
                    return Image.asset(AppTag.accessoryImageDefault,
                    );
                  },
                ),
                ),
                //
                title: Text(AppTag.accessoryTitle(accessory.name, accessory.modelNumber)),
                subtitle: Text(AppTag.accessorySubtitle(accessory.location?.name)),
                //
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AccessoryDetailScreen(accessory: accessory),
                    ),
                  );
                },
              )
          );
        }
    );

  }


// .............    .............

  Future<AccessoriesList> fetchAccessoriesList() async {

    final url = Api.urlUserAccessories('${widget.userId}');
    final dio = Api.createDio(baseUrl: url, trustSelfSigned: true );

    final response = await dio.get(
      url,
      options: Options(
        headers: { 'authorization': 'Bearer ${Api.authorizationBearerKey}', },
      ),
    );

    if (response.statusCode == 200) {
      debugPrint(response.data);
      var licenseList = AccessoriesList.fromJson(response.data as Map<String, dynamic>);
      return licenseList;
    } else {
      throw Exception(AppTag.getAccessoriesListException);
    }
  }

}  // Fin de la clase
