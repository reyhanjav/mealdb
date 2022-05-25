import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../core/constant/app_colors.dart';

class PagesShimmer extends StatelessWidget {
  const PagesShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      enabled: true,
      child: SizedBox(
        child: Container(
          height: 300,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColor.lightGrey,
          ),
        ),
      ),
    );
  }
}
