import 'dart:convert';

import 'package:drower/core/store.dart';
import 'package:drower/home_widgets/Catalog_list.dart';
import 'package:drower/models/cart.dart';
import 'package:drower/routes/MyRoutes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:drower/models/catelog.dart';
import 'package:drower/widgets/drower.dart';
import 'package:drower/widgets/theme.dart';

import 'home_widgets/Catalog_header.dart';
import 'widgets/item_widget.dart';
import 'package:http/http.dart' as http ;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final url = "http://192.168.43.164/api/api.php?action=test";
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    var Json = await rootBundle.loadString("assets/files/catelog.json");
    // var response = await http.get(Uri.parse(url),headers: {});
    // var Json = response.body;
    var decodedData = jsonDecode(Json);
    var product = decodedData["products"];
    CatalogModel.Items =
        List.from(product).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
      floatingActionButton: VxBuilder(
        mutations: {AddMutation,RemoveMutation},
        builder: (context,_) => FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, MyRoutes.cart),
          backgroundColor: AppTheme.darkBluishColor,
          child: Icon(CupertinoIcons.cart),
        ).badge(color: Colors.red[400],size: 20,count: _cart.items.length,textStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold)
          ),
      ),
      backgroundColor: AppTheme.creamColor,
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if (CatalogModel.Items != null && CatalogModel.Items.isNotEmpty)
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

void showToastMessage(String message){
    Fluttertoast.showToast(
            msg: message,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0
        );
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