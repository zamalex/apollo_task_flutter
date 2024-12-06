import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../providers/items_provider.dart';
import '../../theme.dart';

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
            return Padding(
              padding: const EdgeInsets.all(10),
              child: isLoading
                  ? Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.grey.shade300,
                  ),
                  title: Container(
                    color: Colors.grey.shade300,
                    height: 20,
                    width: 100,
                  ),
                  subtitle: Container(
                    color: Colors.grey.shade300,
                    height: 15,
                    width: 150,
                  ),
                ),
              )
                  : ListTile(
                contentPadding: EdgeInsets.zero,
                trailing:
                (value.ingredients[index].product!.availableInStore ??
                    false)
                    ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${value.ingredients[index].product!.price} ${value.ingredients[index].product!.currency ?? 'EGP'}',
                      style: const TextStyle(
                          color: Colors.grey, fontSize: 16),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const CircleAvatar(
                      radius: 12,
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                      ),
                      backgroundColor: AppTheme.kPrimaryColor,
                    ),
                  ],
                )
                    : const Text('Back in 3 days'),
                leading: CachedNetworkImage(
                  width: 50,
                  imageUrl:
                  value.ingredients[index].product!.imageUrl ?? '',
                ),
                title: Text(value.ingredients[index].product!.name ?? ''),
                subtitle: Text(
                  '${value.ingredients[index].quantity!}x50 ${value.ingredients[index].product!.unit!}',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
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
