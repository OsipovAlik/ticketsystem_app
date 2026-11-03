
import 'package:flutter/material.dart';
import '../../../theme/box_decoration.dart';
import '../global_shimmer/global_shimmer.dart';


class SliderShimmer extends StatelessWidget {
const SliderShimmer({ super.key });

  @override
  Widget build(BuildContext context){
    return GlobalShimmer(
      child: Container(
          decoration: MyBoxDecoration.loadCard,
          margin: const EdgeInsets.all(16.0),
          width: MediaQuery.of(context).size.width,
          child:const AspectRatio(
            aspectRatio: 1.6,
            child:SizedBox.shrink()
          ),
        ),
    );
  }
}

     