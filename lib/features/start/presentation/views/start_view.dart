import 'package:flutter/material.dart';
import 'package:news/features/start/presentation/views/widgets/start_view_body.dart';

class StartView extends StatelessWidget {
  const StartView({super.key});

  static const routeName = 'StartView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StartViewBody(),
    );
  }
}
