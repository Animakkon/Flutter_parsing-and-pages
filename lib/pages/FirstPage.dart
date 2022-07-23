import 'package:flutter/material.dart';
import 'package:pages/pages/CathegoryPage.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super (key: key);

  @override
  State<StatefulWidget> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  static const List<String> cathegories = ["education", "recreational"];

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
      ),
      body: Center(
        child: ListView.builder(
              itemCount: cathegories.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 100,
                  color: Colors.indigoAccent,
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CathegoryPage(cathegoryName: cathegories[index])));
                      },
                      child: Text(
                          cathegories[index],
                        style: const TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.bold),
                      ),
                  ),
                  ),
                  //
                );
                // return
              }
          )
      )
    );
  }

}