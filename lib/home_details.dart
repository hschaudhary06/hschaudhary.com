import 'package:drower/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:drower/models/catelog.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetail extends StatelessWidget {
  final Item catalog;
  const HomeDetail({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.creamColor,
      appBar: AppBar(),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.xl3.red800.make(),
            ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    AppTheme.darkBluishColor,
                  ),
                  shape: MaterialStateProperty.all(StadiumBorder()),
                ),
                child: "Buy".text.make()
              ).wh(80, 40),
          ],
        ).p16(),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Hero(
                    tag: Key(catalog.id.toString()),
                    child: Image.network(catalog.img))
                .h40(context),
            Expanded(
                child: VxArc(
              height: 30.0,
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP,
              child: Container(
                color: Colors.white,
                width: context.screenWidth,
                child: Column(
                  children: [
                    catalog.name.text.xl4
                        .color(AppTheme.darkBluishColor)
                        .bold
                        .make(),
                    catalog.des.text.lg.textStyle(context.captionStyle).make(),
                    10.heightBox,
                  ],
                ).py64(),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
