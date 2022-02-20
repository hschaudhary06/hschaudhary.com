import 'dart:convert';

import 'package:drower/home_widgets/Catalog_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:drower/models/catelog.dart';
import 'package:drower/widgets/drower.dart';
import 'package:drower/widgets/theme.dart';

import 'home_widgets/Catalog_header.dart';
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
    CatelogModal.Items =
        List.from(product).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // final dumyList = List.generate(30, (index) => CatelogModal.Items[0]);
    return Scaffold(
      backgroundColor: AppTheme.creamColor,
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if (CatelogModal.Items != null && CatelogModal.Items.isNotEmpty)
                CatalogList().py16().expand()
              else
                CircularProgressIndicator().centered().expand(),

            ],
          ),
        ),
      ),
    );
  }
}

/* ListView.builder(
            itemCount: CatelogModal.Items.length,
            itemBuilder: (context, index) =>
             ItemWidget(item: CatelogModal.Items[index]),
          ) */
// body
/* Padding(
        padding: const EdgeInsets.all(10.0),
        child: (CatelogModal.Items != null && CatelogModal.Items.isNotEmpty)
            ? GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                ), 
                itemBuilder: (context,index){
                  final item = CatelogModal.Items[index];
                  return Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: GridTile(
                    header: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                      ),
                      child: Text(item.name, style: TextStyle(color: Colors.white),),
                      ),
                    child: Image.network(item.img),
                    footer: Text(item.price.toString()),
                    ),
                  );
                },
                itemCount: CatelogModal.Items.length,
                )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: MyDrower(), */