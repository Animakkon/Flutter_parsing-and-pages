import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

Future<Action> fetchAction(http.Client client, String type) async {
    final response = await client.get(Uri.parse('http://www.boredapi.com/api/activity?type=${type}'));
    print("${response.statusCode}    ${response.headers}");
    if (response.statusCode == 200) {
      return Action.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('failed to load');
    }
}
// может возникнуть проблема с парсингом приходящего ответа - поставить стринг
class Action {
  final String activity;
  final String type;
  final int participants;
  final String price;
  final String link;
  final String key;
  final String accessibility;

  const Action({
      required this.activity,
      required this.type,
      required this.participants,
      required this.price,
      required this.link,
      required this.key,
      required this.accessibility
  });

  factory Action.fromJson(Map<String, dynamic> json) {
    return Action(
        activity: json['activity'] as String,
        type: json['type'] as String,
        participants: json['participants'] as int,
        price: json['price'].toString(),
        link: json['link'] as String,
        key: json['key'] as String,
        accessibility: json['accessibility'].toString(),
    );
  }

}

class ActionElement extends StatelessWidget {
  const ActionElement({Key? key, required this.cathegory}) : super(key: key);
  final String cathegory;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<Action>(
        future: fetchAction(http.Client(), cathegory),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text("Ошибка запроса!"),
            );
          } else if (snapshot.hasData) {
            return Container(
              child: Text('${snapshot.data?.activity}'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}