import 'package:apollo_task_flutter/data/model/list_response.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DetailsAppBar extends StatelessWidget {
  const DetailsAppBar({
    super.key,
    required this.item,
    required this.isLoading,
    required this.chewieController,
  });

  final Item item;
  final bool isLoading;
  final ChewieController? chewieController;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      pinned: true,
      title: Text(item.name??''),
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
        onPressed: () => Navigator.of(context).pop(),
      ),
      expandedHeight: 300,
      flexibleSpace: Stack(
        children: [
          FlexibleSpaceBar(
             // title: Text(item.name ?? ''),
              background: isLoading
                  ? Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  color: Colors.white,
                  width: double.infinity,
                  height: double.infinity,
                ),
              )
                  : chewieController!=null?Chewie(
                controller: chewieController!,
              ):CachedNetworkImage(
                imageUrl: item.image ?? '',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              )
          ),
          Positioned(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 10,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15))),
            ),
            bottom: 0,
          )
        ],
      ),
    );
  }
}
