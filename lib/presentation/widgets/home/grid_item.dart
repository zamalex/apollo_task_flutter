import 'package:apollo_task_flutter/data/model/list_response.dart';
import 'package:apollo_task_flutter/presentation/screens/details/details_Screen.dart';
import 'package:apollo_task_flutter/presentation/widgets/home/duration_widget.dart';
import 'package:apollo_task_flutter/presentation/widgets/home/spotlight.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class GridItem extends StatelessWidget {
  const GridItem({super.key, required this.item});

  final Item item;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DetailsScreen(),
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
                      flex: 5,
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
                                        Image.asset('assets/rabbit.png'),
                                    placeholder: (context, url) =>
                                        Image.asset('assets/rabbit.png'),
                                    memCacheHeight: 400,
                                    memCacheWidth: 400,
                                    imageUrl: item.image ?? '',
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: double.infinity,
                                  ),
                                ),
                                
                                Positioned(child: Spotlight(),top:5,left: 5,),
                                Positioned(child:DurationWidget(),bottom:5,left: 5,)
                              ],
                            ),
                          ),
                        ],
                      )),
                  Expanded(
                      flex: 4,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.name ?? '',
                              style: TextStyle(
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
                                    item.creatorImage ?? '',
                                  ),
                                ),
                                title: Text('powered by'),
                                subtitle: Text(
                                  item.creatorName ?? '',
                                  maxLines: 1,
                                  style: TextStyle(
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
