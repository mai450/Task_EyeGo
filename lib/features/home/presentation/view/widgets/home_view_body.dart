import 'package:flutter/material.dart';

import '../../../../../core/utils/adaptive_layout.dart';
import 'mobile_layout.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      mobileLayout: (context) => MobileLayout(),
      tabletLayout: (context) => MobileLayout(),
      desktopLayout: (context) => MobileLayout(),
    );
  }
}
