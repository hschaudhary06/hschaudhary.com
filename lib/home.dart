import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:drower/models/catelog.dart';
import 'package:drower/widgets/drower.dart';
import 'package:drower/widgets/theme.dart';

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
              if(CatelogModal.Items != null && CatelogModal.Items.isNotEmpty)
                CatalogList().expand()
              else
                Center(
                  child: CircularProgressIndicator(),
                ),
            ],
          ),
        ),
      ),
      

    );
  }
}
class CatalogHeader extends StatelessWidget {
  const CatalogHeader({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              "Catalog App".text.xl4.bold.color(AppTheme.darkBluishColor).make(),
              "Treanding Products".text.make(),
            ],
          );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
            shrinkWrap: true,
            itemCount: CatelogModal.Items.length,
            itemBuilder: (context, index){
              final catalog = CatelogModal.Items[index];
              return CatalogItem(catalog: catalog);
            },
          );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;
  
  const CatalogItem({
    Key? key,
    required this.catalog,
  }) : assert(catalog!=null), super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          CatalogImg(image: catalog.img),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.lg.color(AppTheme.darkBluishColor).bold.make(),
              catalog.des.text.textStyle(context.captionStyle).make(),
              ButtonBar(
                children: [
                  catalog.price.text.make()
                ],
              )
            ],
          ))
        ],
        
      )
    ).white.roundedLg.square(100).make().py16();
  }
}

class CatalogImg extends StatelessWidget {
  final String image; 
  const CatalogImg({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(image).box.roundedSM.p8.color(AppTheme.creamColor).make().p12().w32(context);
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