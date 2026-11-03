import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class GlobalCashImg extends StatelessWidget {
  final String photo;
  final BoxFit fit;
  final double? width;
  final double? height;
  final Color? color;
  const GlobalCashImg({super.key, required this.photo, required this.fit, this.width, this.height, this.color});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: fit,
      color: color,
      imageUrl: photo,
      height: height,
      width: width,
      placeholder: (context, url) => Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            width: 400,
            height: 400,
            color: Colors.white,
          )),
      errorWidget: (context, url, error) =>
          Image.asset('lib/assets/images/logo.png'),
    );
  }
}
