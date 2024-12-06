import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../data/model/details_response.dart';
import '../../theme.dart';

class IngredientWidget extends StatelessWidget {
  const IngredientWidget({
    super.key,
    required this.isLoading,
    required this.ingredient
  });

  final ListProduct? ingredient;

  final bool isLoading;

  @override
  Widget build(BuildContext context) {
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
        (ingredient!.product!.availableInStore ??
            false)
            ? Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${ingredient!.product!.price} ${ingredient!.product!.currency ?? 'EGP'}',
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
          ingredient!.product!.imageUrl ?? '',
        ),
        title: Text(ingredient!.product!.name ?? ''),
        subtitle: Text(
          '${ingredient!.quantity!}x50 ${ingredient!.product!.unit!}',
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}