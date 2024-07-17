import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:second_blood/api.dart';
import 'package:second_blood/model/app_tags.dart';
import 'package:second_blood/model/license_list.dart';
import 'package:second_blood/presentation/screen/license_detail_widget.dart';

// ...............................................

class LicenseListScreen extends StatefulWidget {
  final int? userId;
  final LicenseList? licenseList;

  const LicenseListScreen({super.key, required this.userId, this.licenseList});

  @override
  State<LicenseListScreen> createState() => _LicenseListScreenState();
}



class _LicenseListScreenState extends State<LicenseListScreen> {
  late Future<LicenseList> futureLicenseList;

  @override
  void initState() {
    super.initState();
    futureLicenseList = fetchLicenseList();
  }


// .............    .............

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppTag.userLicenses, style: TextStyle(color: Colors.white)),
      ),
      body: getBody(context),
    );
  }


// .............    .............

  Widget getBody(BuildContext context) {
    return Center(
      child: FutureBuilder<LicenseList>(
        future: futureLicenseList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data?.total == 0) {
              return const Text(AppTag.licenseNoLicenseMsg, style: TextStyle(color: Colors.black));
            }
            else {
              return getLicenseList(snapshot.data as LicenseList);
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

  Widget getLicenseList(LicenseList data) {

    return ListView.builder(
        itemCount: data.total,
        itemBuilder: (BuildContext context, int index) {

          if (data.total == 0) {
            return const Text(AppTag.licenseNoLicenseMsg, style: TextStyle(color: Colors.black));
          }

          final license = data.licenses[index];

          return Card(
              child: ListTile(
                leading:
                CircleAvatar(
                  backgroundColor: AppTag.appBarColor,
                  radius: 20,
                  child: Text('${license.id}', style: const TextStyle(color: Colors.white)),
                ),
                //
                title: Text(AppTag.licenseTitle(license.name, license.productKey)),
                subtitle: Text(AppTag.licenseSubtitle(license.category?.name)),
                //
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LicenseDetailScreen(license: license),
                    ),
                  );
                },
              )
          );
        }
    );

  }


// ...............................................

  Future<LicenseList> fetchLicenseList() async {

    final url = Api.urlUserLicenses('${widget.userId}');
    final dio = Api.createDio(baseUrl: url, trustSelfSigned: true );

    final response = await dio.get(
      url,
      options: Options(
        headers: { 'authorization': 'Bearer ${Api.authorizationBearerKey}', },
      ),
    );

    if (response.statusCode == 200) {
      var licenseList = LicenseList.fromJson(response.data as Map<String, dynamic>);
      return licenseList;
    } else {
      throw Exception(AppTag.getLicenseListException);
    }
  }

}  // Fin de la clase
