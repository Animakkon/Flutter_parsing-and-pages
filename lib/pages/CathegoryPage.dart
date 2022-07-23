import 'package:flutter/material.dart';
import 'package:pages/elements/ActionElement.dart';

class CathegoryPage extends StatelessWidget {
  const CathegoryPage({Key? key, required this.cathegoryName}) : super(key: key);

  final String cathegoryName;

  @override
  Widget build(BuildContext context) {
    // return const ActionElement();
    return Scaffold(
      appBar: AppBar(
        title: Text(cathegoryName),
      ),
      // body: ActionElement(cathegory: cathegoryName),
      body: ListView.builder(
          itemBuilder: (context, index){
            return ActionElement(cathegory: cathegoryName);
          }
      ),

    );
  }

}