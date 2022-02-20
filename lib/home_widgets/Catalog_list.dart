import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:drower/home_details.dart';
import 'package:drower/home_widgets/Catalog_img.dart';
import 'package:drower/models/catelog.dart';
import 'package:drower/widgets/theme.dart';

import 'add_to_cart.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.Items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.Items[index];
        return InkWell(
          onTap: () => Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (context) => HomeDetail(catalog: catalog),
              ),
          ),
          child: CatalogItem(catalog: catalog),
          );
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({
    Key? key,
    required this.catalog,
  })  : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Hero(
          tag: Key(catalog.id.toString()),
          child: CatalogImg(image: catalog.img
          )),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog.name.text.lg.color(AppTheme.darkBluishColor).bold.make(),
            catalog.des.text.textStyle(context.captionStyle).make(),
            10.heightBox,
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.zero,
              children: [
                "\$${catalog.price}".text.make(),
                AddToCart(catalog: catalog)
              ],
            ).pOnly(right: 8.0)
          ],
        ))
      ],
    )).white.rounded.square(130).make().py16();
  }
}
