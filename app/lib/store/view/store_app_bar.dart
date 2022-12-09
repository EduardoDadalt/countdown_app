import 'package:countdown_app/store/controller/store_controller.dart';
import 'package:countdown_app/store/domain/entity/category.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class StoreAppBar extends StatefulWidget {
  const StoreAppBar({super.key});

  @override
  State<StoreAppBar> createState() => _StoreAppBarState();
}

class _StoreAppBarState extends State<StoreAppBar> {
  late Future<List<Category>> _futureGetCategories;

  @override
  void initState() {
    super.initState();
    _futureGetCategories =
        Provider.of<StoreController>(context, listen: false).getCategories();
  }

  @override
  Widget build(BuildContext context) {
    final Category? selectedCategory =
        Provider.of<StoreController>(context).selectedCategory;
    return SliverAppBar(
      floating: true,
      toolbarHeight: 40,
      flexibleSpace: FlexibleSpaceBar(
        background: FutureBuilder<List<Category>>(
          future: _futureGetCategories,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  "Error loading categories",
                  style: TextStyle(
                    color: Theme.of(context).errorColor,
                  ),
                ),
              );
            }
            final List<Category>? categories = snapshot.data;
            final bool isLoading =
                snapshot.connectionState == ConnectionState.waiting;
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final Category? category = categories?[index];
                final bool isSelected = category == selectedCategory;
                return Card(
                  elevation: 5,
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  color: isSelected ? Theme.of(context).primaryColor : null,
                  child: InkWell(
                    onTap: () {
                      Provider.of<StoreController>(context, listen: false)
                          .selectedCategory = category;
                    },
                    child: Ink(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 4,
                          vertical: 2,
                        ),
                        child: Center(
                          child: !isLoading
                              ? Text(
                                  category!.name,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .merge(
                                        const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                )
                              : Shimmer.fromColors(
                                  baseColor: Colors.grey.shade400,
                                  highlightColor: Colors.grey.shade100,
                                  child: Container(
                                    height: 16,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ),
                );
              },
              itemCount: categories?.length ?? 10,
            );
          },
        ),
      ),
    );
  }
}
