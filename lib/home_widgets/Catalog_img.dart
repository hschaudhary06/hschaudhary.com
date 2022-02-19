import 'package:drower/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogImg extends StatelessWidget {
  final String image;
  const CatalogImg({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .roundedSM
        .p8
        .color(AppTheme.creamColor)
        .make()
        .p12()
        .w32(context);
  }
}