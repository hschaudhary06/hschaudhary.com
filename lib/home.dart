import 'dart:convert';

import 'package:drower/models/catelog.dart';
import 'package:drower/widgets/drower.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'widgets/item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    var Json = await rootBundle.loadString("assets/files/catelog.json");
    var decodedData = jsonDecode(Json);
    var product = decodedData["products"];
    CatelogModal.Items = List.from(product).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() { });
  }

  @override
  Widget build(BuildContext context) {
    // final dumyList = List.generate(30, (index) => CatelogModal.Items[0]);
    return Scaffold(
      appBar: AppBar(
        title: Text("Catelog App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: (CatelogModal.Items != null && CatelogModal.Items.isNotEmpty)?ListView.builder(
            itemCount: CatelogModal.Items.length,
            itemBuilder: (context, index) {
              return ItemWidget(item: CatelogModal.Items[index]);
            },
          ):
          Center(child: CircularProgressIndicator(),),
      ),
      drawer: MyDrower(),
    );
  }
}
