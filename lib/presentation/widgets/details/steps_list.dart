import 'package:apollo_task_flutter/presentation/widgets/details/step_widget.dart';
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
            return StepWidget(isLoading: isLoading,step:isLoading?null: value.steps[index],);
          },
          separatorBuilder: (BuildContext context, int index) {
            return const DashedDivider();
          },
        );
      },
    );
  }
}
