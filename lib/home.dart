import 'package:drower/models/catelog.dart';
import 'package:drower/widgets/drower.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widgets/item_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final dumyList = List.generate(30, (index) => CatelogModal.Items[0]);
    return Scaffold(
      appBar: AppBar(
        title: Text("Catelog App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
            itemCount: CatelogModal.Items.length,
            itemBuilder: (context, index) {
              return ItemWidget(item: CatelogModal.Items[index]);
            },
          ),
      ),
      drawer: MyDrower(),
    );
  }
}
