import 'package:apollo_task_flutter/data/model/list_response.dart';
import 'package:apollo_task_flutter/presentation/theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DetailsAppBar extends StatelessWidget {
  const DetailsAppBar({
    super.key,
    required this.isCollapsed,
    required this.recipe,
    required this.isLoading,
    required this.chewieController,
  });

  final Recipe recipe;
  final bool isLoading;
  final bool isCollapsed;
  final ChewieController? chewieController;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.white,
      floating: true,
      pinned: true,
    //  title: Text(recipe.name??''),
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios_new, color: isCollapsed?AppTheme.kPrimaryColor:Colors.black),
        onPressed: () => Navigator.of(context).pop(),
      ),
      expandedHeight: 300,
      flexibleSpace: Stack(
        children: [
          FlexibleSpaceBar(
              title: Text(isCollapsed?recipe.name ?? '':'',style: const TextStyle(color: AppTheme.kPrimaryColor),),
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
                imageUrl: recipe.image ?? '',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              )
          ),
          if(!isCollapsed)
          Positioned(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 20,
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
