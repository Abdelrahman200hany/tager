import 'package:flutter/material.dart';
import 'package:tager/core/uitls/app_color.dart';
import 'package:tager/feature/cart/presentaion/views/cart_view.dart';
import 'package:tager/feature/catogry/presentation/views/catogry_view.dart';
import 'package:tager/feature/home/presentation/views/home_view.dart';

class MainViewBody extends StatefulWidget {
  const MainViewBody({super.key});

  @override
  State<MainViewBody> createState() => _MainViewBodyState();
}

class _MainViewBodyState extends State<MainViewBody> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColor.kPrimaryColorLight,
        unselectedItemColor: Colors.grey,

        currentIndex: currentIndex,
        onTap: (value) {
          currentIndex = value;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(label: 'الرئيسة', icon: Icon(Icons.home)),
          BottomNavigationBarItem(
            label: 'السلة',
            icon: Icon(Icons.category_outlined),
          ),
          BottomNavigationBarItem(
            label: 'المفضلة',
            icon: Icon(Icons.card_travel_outlined),
          ),
          BottomNavigationBarItem(
            label: 'الاعدادات',
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: IndexedStack(
        index: currentIndex,
        children: [HomeView(), CatogryView(), CartView(), SizedBox()],
      ),
    );
  }
}
