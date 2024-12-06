import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../../data/model/details_response.dart' as ss;
import '../../theme.dart';

class StepWidget extends StatelessWidget {
  const StepWidget({super.key,required this.isLoading,this.step});

  final bool isLoading;
  final ss.Step? step;

  @override
  Widget build(BuildContext context) {
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
                radius: 15,
                child: Text(
                 step!.stepNum.toString(),
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
          if (step!.image != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                  imageUrl: step!.image!),
            ),
          Text(step!.description ?? '')
        ],
      ),
    );
  }
}
