import 'package:flutter/material.dart';
import 'package:quran_app/presentation/hadith_details/hadith_details.dart';
import 'package:quran_app/presentation/main_layout/main_layout.dart';
import 'package:quran_app/presentation/onboarding/onboarding.dart';
import 'package:quran_app/presentation/quran_details/quran_details.dart';

import '../../presentation/splash/splash.dart';

class RoutesManager {
  static const splash = "/splash";
  static const main_layout = '/main_layout';
  static const onBording ='/onBording';
  static const quranDetails='/quranDetails';
  static const hadithDetails='/hadithDetails';



  static Map<String, WidgetBuilder> router = {
    splash: (_) =>  Splash(),
    main_layout:(_)=>  MainLayout(),
    onBording:(_)=>  OnBoarding(),
    quranDetails:(_)=> QuranDetails(),
    hadithDetails: (_)=> HadithDetails(),

  };
}