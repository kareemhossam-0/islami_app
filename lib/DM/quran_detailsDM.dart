
import 'package:flutter/material.dart';

import '../core/resources/constant_manager.dart';
import '../presentation/main_layout/tabs/quran/widgets/most_recent_card.dart';

class QuranDetailsArguments {
  final SuraDM suraDM;
  final GlobalKey<MostRecentState> mostRecentKey;

  const QuranDetailsArguments(
      {required this.suraDM, required this.mostRecentKey});
}
