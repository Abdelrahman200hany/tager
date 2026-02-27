import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:tager/core/uitls/app_style.dart';
import 'package:tager/core/uitls/assets.dart';
import 'package:tager/feature/onBoarding_feature/data/models/onboading_view_item_model.dart';
import 'package:tager/feature/onBoarding_feature/presentaion/views/widgets/page_view_item.dart';

class ExpandedPageView extends StatefulWidget {
  const ExpandedPageView({super.key, required this.pageController});
  final PageController pageController;

  @override
  State<ExpandedPageView> createState() => _ExpandedOnBoardingPageViewState();
}

class _ExpandedOnBoardingPageViewState extends State<ExpandedPageView> {
  final List<OnboadingViewItemModel> item = const [
    OnboadingViewItemModel(
      backGroundImage: Assets.assetsImageOnBoardingBackGround1,
      imageLoge: Assets.assetsImageOnBording1,
      title: ' مرحبًا بك في FruitHUB',
      subtitle:
          'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
    ),
    OnboadingViewItemModel(
      backGroundImage: Assets.assetsImageOnBoardingBackGround2,
      imageLoge: Assets.assetsImageOnBording2,
      title: 'ابحث وتسوق',
      subtitle:
          'نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ExpandablePageView.builder(
      controller: widget.pageController,
      scrollDirection: Axis.horizontal,

      itemCount: item.length,
      itemBuilder: (context, index) => Column(
        children: [
          PageViewItem(item: item[index], index: index),
          SizedBox(height: 48),
          Text(item[index].title, style: AppStyle.styleBold23(context)),
          SizedBox(height: 48),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              item[index].subtitle,
              style: AppStyle.styleSemiBold13(context),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
