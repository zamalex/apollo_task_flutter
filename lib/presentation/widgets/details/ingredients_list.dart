import 'package:apollo_task_flutter/data/model/details_response.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../providers/items_provider.dart';
import '../../theme.dart';
import 'ingredient_widget.dart';

class IngredientsList extends StatelessWidget {
  const IngredientsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ItemsProvider>(
      builder: (context, value, child) {
        bool isLoading = value.isLoading;

        return SliverList.separated(
          itemCount: isLoading ? 5 : value.ingredients.length,
          // Show 5 items as placeholders while loading
          itemBuilder: (BuildContext context, int index) {
            return IngredientWidget(isLoading: isLoading,ingredient: isLoading?null:value.ingredients[index],);
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(
              color: AppTheme.kGreyColor,
            );
          },
        );
      },
    );
  }
}


