import 'package:countdown_app/countdown/domain/entity/countdown.dart';
import 'package:countdown_app/countdown/view/countdown_card.dart';
import 'package:countdown_app/store/controller/store_controller.dart';
import 'package:countdown_app/store/domain/entity/category.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StoreContent extends StatelessWidget {
  const StoreContent({super.key});

  @override
  Widget build(BuildContext context) {
    final Category? category =
        Provider.of<StoreController>(context).selectedCategory;
    if (category == null) {
      return const SliverToBoxAdapter(
        child: Center(
          child: Text('No category selected'),
        ),
      );
    }
    return FutureBuilder(
        future: Provider.of<StoreController>(context).getCountdownByCategory(
          page: 1,
          size: 24,
        ),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const SliverToBoxAdapter(
              child: Center(
                child: Text('Error loading products'),
              ),
            );
          }

          final isLoading = snapshot.connectionState == ConnectionState.waiting;

          final List<Countdown>? countdowns = snapshot.data;

          if (countdowns?.isEmpty == true) {
            return const SliverFillRemaining(
              child: Center(
                child: Text('No countdowns found'),
              ),
            );
          }
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return CountdownCard(
                  countdown: countdowns![index],
                );
              },
              childCount: countdowns?.length ?? 0,
            ),
          );
        });
  }
}
