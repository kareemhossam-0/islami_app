import 'package:flutter/material.dart';
import 'package:quran_app/presentation/main_layout/tabs/hadith/hadith.dart';
import 'package:quran_app/presentation/main_layout/tabs/radio/radio.dart' as my_radio;
import 'package:quran_app/presentation/main_layout/tabs/tasbeh/tasbeh.dart';
import 'package:quran_app/presentation/main_layout/tabs/time/time.dart';




import '../../core/resources/assets_manager.dart';
import '../../core/resources/colors_manager.dart';
import 'tabs/quran/quran.dart';

class MainLayout extends StatefulWidget {
  MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  Gradient mainLayoutGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        ColorsManager.black.withOpacity(0.7),
        ColorsManager.black,
      ]);

  List<Widget> tabs = const [
    Quran(),
    Hadith(),
    Tasbeh(),
    my_radio.Radio(),
    Time(),
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: mainLayoutGradient,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: tabs[selectedIndex],
        bottomNavigationBar: buildBottomNavBar(),
      ),
    );
  }

  void _onBottomNavBarItemClicked(int newItemIndex) {
    setState(() {
      selectedIndex = newItemIndex;
    });
  }

  Widget buildBottomNavBar() {
    return BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: _onBottomNavBarItemClicked,
        items: [
          BottomNavigationBarItem(
              icon: buildIcon(
                  iconsPath: AssetsManager.quranIcon,
                  isSelected: selectedIndex == 0),
              label: "Quran"),
          BottomNavigationBarItem(
              icon: buildIcon(
                  iconsPath: AssetsManager.hadithIcon,
                  isSelected: selectedIndex == 1),
              label: "Hadith"),
          BottomNavigationBarItem(
              icon: buildIcon(
                  iconsPath: AssetsManager.sebhaIcon,
                  isSelected: selectedIndex == 2),
              label: "Tasbeh"),
          BottomNavigationBarItem(
              icon: buildIcon(
                  iconsPath: AssetsManager.radioIcon,
                  isSelected: selectedIndex == 3),
              label: "Radio"),
          BottomNavigationBarItem(
              icon: buildIcon(
                  iconsPath: AssetsManager.timeIcon,
                  isSelected: selectedIndex == 4),
              label: "Time"),
        ]);
  }

  Widget buildIcon({required String iconsPath, required bool isSelected}) {
    return isSelected
        ? Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
            decoration: BoxDecoration(
              color: ColorsManager.black.withOpacity(0.6),
              borderRadius: BorderRadius.circular(33),
            ),
            child: ImageIcon(
              AssetImage(iconsPath),
            ),
          )
        : ImageIcon(
            AssetImage(iconsPath),
          );
  }
}
