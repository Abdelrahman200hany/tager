import 'package:flutter/material.dart';
import 'package:tager/core/entity/product_entity.dart';
import 'package:tager/core/uitls/app_color.dart';
import 'package:tager/core/uitls/app_style.dart';
import 'package:tager/core/uitls/assets.dart';
import 'package:tager/feature/home/presentation/views/widgets/increment_widget.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.item});

  final ProductEntity item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F5F7),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black.withValues(alpha: 0.1)),
      ),
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 220 / 170,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: item.productImage == null
                          ? AssetImage(Assets.assetsImageMyphoto)
                          : NetworkImage(item.productImage!),
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
                Positioned(
                  top: 6,
                  right: 6,
                  child: Icon(Icons.favorite_outline_outlined),
                ),
              ],
            ),
          ),

          SizedBox(height: 6),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              item.productName,
              style: AppStyle.styleSemiBold13(
                context,
              ).copyWith(color: const Color(0xFF0C0D0D)),
            ),
            subtitle: Text(
              '${item.productPrice} جنية / الكيلو',
              style: AppStyle.styleSRegular13(
                context,
              ).copyWith(color: AppColor.kSecondyColorLight),
            ),
            trailing: IncrementWidget(),
          ),
        ],
      ),
    );
  }
}
