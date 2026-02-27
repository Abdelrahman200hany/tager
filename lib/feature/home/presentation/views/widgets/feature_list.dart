import 'package:flutter/material.dart';
import 'package:tager/feature/home/presentation/views/widgets/feature_item.dart';

class FeatureList extends StatelessWidget {
  const FeatureList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:158 ,
      child: ListView.builder(scrollDirection: Axis.horizontal,
     
        physics: BouncingScrollPhysics(),
        itemCount: 4,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 12),
            child: FeatureItem(),
          );
        },
      ),
    );
  }
}
