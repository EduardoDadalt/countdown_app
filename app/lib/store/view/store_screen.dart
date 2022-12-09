import 'package:countdown_app/store/view/store_app_bar.dart';
import 'package:countdown_app/store/view/store_content.dart';
import 'package:flutter/material.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        StoreAppBar(),
        StoreContent(),
      ],
    );
  }
}
