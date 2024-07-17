import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:second_blood/api.dart';
import 'package:second_blood/model/app_tags.dart';
import 'package:second_blood/model/asset_list.dart';
import 'package:second_blood/presentation/screen/asset_detail_widget.dart';

// ...............................................

class AssetListScreen extends StatefulWidget {
  final int? userId;
  final AssetList? assetList;

  const AssetListScreen({super.key, required this.userId, this.assetList});

  @override
  State<AssetListScreen> createState() => _AssetListScreenState();
}



class _AssetListScreenState extends State<AssetListScreen> {
  late Future<AssetList> futureAssetList;

  @override
  void initState() {
    super.initState();
    futureAssetList = fetchAssetList();
  }


// .............    .............

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppTag.userAssets, style: TextStyle(color: Colors.white)),
      ),
      body: getBody(context),
    );
  }


// .............    .............

  Widget getBody(BuildContext context) {
    return Center(
      child: FutureBuilder<AssetList>(
        future: futureAssetList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {

            if (snapshot.data?.total == 0) {
              return const Text(AppTag.assetNoAssetMsg);
            }
            else {
              return getAssetList(snapshot.data as AssetList);
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

  Widget getAssetList(AssetList data) {

    return ListView.builder(
        itemCount: data.total,
        itemBuilder: (BuildContext context, int index) {

          if (data.total == 0) {
            return const Text(AppTag.assetNoAssetMsg);
          }

          final asset = data.assets[index];

          return Card(
              child: ListTile(
                leading:
                ClipOval(child: FadeInImage(
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                  image:NetworkImage('${asset.image}'),
                  placeholder: const AssetImage(AppTag.assetImageDefault),
                  imageErrorBuilder:(context, error, stackTrace) {
                    return Image.asset(AppTag.assetImageDefault,
                    );
                  },
                ),
                ),
                //
                title: Text(AppTag.assetTitle(asset.model?.name, asset.serial)),
                subtitle: Text(AppTag.assetSubtitle(asset.location?.name)),
                //
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AssetDetailScreen(asset: asset),
                    ),
                  );
                },
              )
          );
        }
    );
  }


// .............    .............

  Future<AssetList> fetchAssetList() async {

    final url = Api.urlUserAssets('${widget.userId}');
    final dio = Api.createDio(baseUrl: url, trustSelfSigned: true );

    final response = await dio.get(
      url,
      options: Options(
        headers: { 'authorization': 'Bearer ${Api.authorizationBearerKey}', },
      ),
    );

    if (response.statusCode == 200) {
      var assetList = AssetList.fromJson(response.data as Map<String, dynamic>);
      return assetList;
    } else {
      throw Exception(AppTag.getAssetListException);
    }
  }

}  // Fin de la clase
