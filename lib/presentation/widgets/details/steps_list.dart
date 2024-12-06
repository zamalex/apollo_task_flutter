import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../providers/items_provider.dart';
import '../../theme.dart';
import 'dashed_divider.dart';

class StepsList extends StatelessWidget {
  const StepsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ItemsProvider>(
      builder: (context, value, child) {
        bool isLoading = value.isLoading;

        return SliverList.separated(
          itemCount: isLoading ? 5 : value.steps.length,
          // Show 5 items as placeholders while loading
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: isLoading
                  ? Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            color: Colors.grey.shade300,
                            width: 60,
                            height: 20,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.grey.shade300,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        color: Colors.grey.shade300,
                        height: 100,
                        width: double.infinity,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        color: Colors.grey.shade300,
                        height: 20,
                        width: 200,
                      ),
                    ],
                  ),
                ),
              )
                  : Column(
                children: [
                  Row(
                    children: [
                      const Text(
                        'Step',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      CircleAvatar(
                        child: Text(
                          value.steps[index].stepNum.toString(),
                          style: const TextStyle(
                              color: Colors.yellow,
                              fontWeight: FontWeight.bold),
                        ),
                        backgroundColor: AppTheme.kPrimaryColor,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  if (value.steps[index].image != null)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: CachedNetworkImage(
                          imageUrl: value.steps[index].image!),
                    ),
                  Text(value.steps[index].description ?? '')
                ],
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const DashedDivider();
          },
        );
      },
    );
  }
}
