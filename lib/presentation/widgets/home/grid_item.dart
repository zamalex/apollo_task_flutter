import 'package:apollo_task_flutter/data/model/list_response.dart';
import 'package:apollo_task_flutter/presentation/screens/details/details_Screen.dart';
import 'package:apollo_task_flutter/presentation/widgets/home/duration_widget.dart';
import 'package:apollo_task_flutter/presentation/widgets/home/spotlight.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class GridItem extends StatelessWidget {
  const GridItem({super.key, required this.recipe});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DetailsScreen(recipe: recipe,),
          ));
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      flex: 4,
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: CachedNetworkImage(
                                    errorWidget: (context, url, error) =>
                                        Image.asset('assets/rabbit.png',fit: BoxFit.cover,),
                                    placeholder: (context, url) =>
                                        Image.asset('assets/rabbit.png',fit: BoxFit.cover,),
                                    memCacheHeight: 400,
                                    memCacheWidth: 400,
                                    imageUrl: recipe.image ?? '',
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: double.infinity,
                                  ),
                                ),
                                
                                const Positioned(child: Spotlight(),top:5,left: 5,),
                                const Positioned(child:DurationWidget(),bottom:5,left: 5,)
                              ],
                            ),
                          ),
                        ],
                      )),
                  Expanded(
                      flex: 3,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              recipe.name ?? '',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  overflow: TextOverflow.ellipsis),
                              maxLines: 2,
                            ),
                            Container(
                              child: ListTile(
                                contentPadding: EdgeInsets.zero,
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                    recipe.creatorImage ?? '',
                                  ),
                                ),
                                title: const Text('powered by'),
                                subtitle: Text(
                                  recipe.creatorName ?? '',
                                  maxLines: 1,
                                  style: const TextStyle(
                                      overflow: TextOverflow.ellipsis),
                                ),
                              ),
                            )
                          ],
                        ),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
