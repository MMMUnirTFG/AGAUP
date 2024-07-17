import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dio/dio.dart';
import 'package:flutter_mailer/flutter_mailer.dart';
import 'package:second_blood/api.dart';
import 'package:second_blood/model/app_tags.dart';
import 'package:second_blood/model/ammo.dart';
import 'package:second_blood/model/user_profile.dart';
import 'package:second_blood/model/consumable_list.dart';

// ...............................................

class ConsumableStockScreen extends StatefulWidget {
  final ConsumableList? consumableStock;
  final UserProfile? userProfile;

  const ConsumableStockScreen({super.key, this.consumableStock, required this.userProfile});

  @override
  State<ConsumableStockScreen> createState() => _ConsumableStockScreenState(userProfile);
}



class _ConsumableStockScreenState extends State<ConsumableStockScreen> {
  late Future<ConsumableList> futureConsumableStock;
  List<Ammo> checkboxList = [];
  final UserProfile? userProfile;

  _ConsumableStockScreenState(this.userProfile);

  @override
  void initState() {
    super.initState();
    futureConsumableStock = fetchConsumableStock();
  }


// .............    .............

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppTag.stockCaption, style: TextStyle(color: Colors.white)),
      ),
      body: getBody(context),
      floatingActionButton: Builder(
        builder: (context) => FloatingActionButton.extended(
          onPressed: () { sendMail(); },
          label: const Text(AppTag.sendButton),
          icon: const Icon(Icons.add),
        ),
      ),
    );
  }


// .............    .............

  Widget getBody(BuildContext context) {
    return Center(
      child: FutureBuilder<ConsumableList>(
        future: futureConsumableStock,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data?.total == 0) {
              return const Text(AppTag.stockNoStockMsg);
            }
            else {
              return getConsumableStock(snapshot.data as ConsumableList);
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

  Widget getConsumableStock(ConsumableList data) {

    return ListView.builder(
        itemCount: data.total,
        itemBuilder: (BuildContext context, int index) {

          if (data.total == 0) {
            return const Text(AppTag.stockNoStockMsg);
          }

          final consumable = data.consumables?[index];
          Ammo municion;

          if (consumable?.image == null) {
            municion = Ammo(consumable?.id, consumable?.name, consumable?.itemNo, consumable?.category?.name, '');
          } else {
            municion = Ammo(consumable?.id, consumable?.name, consumable?.itemNo, consumable?.category?.name, consumable?.image);
          }
          checkboxList.add(municion);

          // ............
          return CheckboxListTile(
            title: Text(AppTag.stockTitle(checkboxList[index].name, checkboxList[index].itemNo)),
            subtitle: Text(AppTag.stockSubtitle(checkboxList[index].category)),
            //
            value: checkboxList[index].isChecked,
            onChanged: (bool? value) {
              setState(() {
                checkboxList[index].isChecked = value!;
              });
            },
            secondary: CircleAvatar(
              radius: 20,
              backgroundColor: AppTag.appBarColor,
              child: Text('${checkboxList[index].id}', style: const TextStyle(color: Colors.white)),
            ),
          );
        }
    );

  }


// .............    .............

  Future<ConsumableList> fetchConsumableStock() async {

    final url = Api.urlAmmoStock();
    final dio = Api.createDio(baseUrl: url, trustSelfSigned: true );

    final response = await dio.get(
      url,
      options: Options(
        headers: { 'authorization': 'Bearer ${Api.authorizationBearerKey}', },
      ),
    );

    if (response.statusCode == 200) {
      var consumibleList = ConsumableList.fromJson(response.data as Map<String, dynamic>);
      return consumibleList;
    } else {
      throw Exception('Failed to load ConsumableStock.');
    }
  }


// .............    .............

  // Código copiado del ejemplo de: https://pub.dev/packages/flutter_mailer
  void sendMail() async { 

    String body = AppTag.bodyMail(userProfile?.name, userProfile?.jobtitle, userProfile?.department?.name, userProfile?.company?.name, checkboxList);

    final MailOptions mailOptions = MailOptions(
      body: body,
      subject: AppTag.subjectMail,
      recipients: [AppTag.recipientsMail],
      isHTML: true,
      // ccRecipients: ['${this.userProfile?.email}'],
    );

    String platformResponse = '';

    try {
      final MailerResponse response = await FlutterMailer.send(mailOptions);
      switch (response) {
        case MailerResponse.saved:
          platformResponse = 'mail was saved to draft';
          break;
        case MailerResponse.sent:
          platformResponse = 'mail was sent';
          break;
        case MailerResponse.cancelled:
          platformResponse = 'mail was cancelled';
          break;
        case MailerResponse.android:
          platformResponse = 'intent was success';
          break;
        default:
          platformResponse = 'unknown';
          break;
      }

      debugPrint(platformResponse);

    } on PlatformException catch (error) {
      debugPrint(error.toString());
      if (!mounted) {
        return;
      }
    }
  }

}
