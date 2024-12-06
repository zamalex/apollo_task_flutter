import 'package:apollo_task_flutter/data/model/list_response.dart';
import 'package:apollo_task_flutter/presentation/providers/items_provider.dart';
import 'package:apollo_task_flutter/presentation/theme.dart';
import 'package:apollo_task_flutter/presentation/widgets/home/duration_widget.dart';
import 'package:apollo_task_flutter/presentation/widgets/home/grid_item.dart';
import 'package:apollo_task_flutter/presentation/widgets/home/spotlight.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart'; // Import shimmer package

import '../../widgets/details/dashed_divider.dart';
import '../../widgets/details/details_button.dart';
import '../../widgets/details/ingredients_list.dart';
import '../../widgets/details/steps_list.dart';
import '../../widgets/details/tabs_widget.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, required this.item});

  final Item item;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int selected = 0;

  getDetails(BuildContext context) {
    Future.delayed(Duration.zero).then(
      (value) {
        Provider.of<ItemsProvider>(context, listen: false).getDetails();
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getDetails(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ItemsProvider>(
        builder: (context, value, child) {
          // Check if data is loading
          bool isLoading = value.isLoading;

          return CustomScrollView(
            slivers: [
              SliverAppBar(
                floating: false,
                pinned: true,
                expandedHeight: 300,
                flexibleSpace: Stack(
                  children: [
                    FlexibleSpaceBar(
                      title: Text(widget.item.name??''),
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
                          : CachedNetworkImage(
                            imageUrl: widget.item.image ?? '',
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                    ),
                    
                    Positioned(child: Container(width: MediaQuery.of(context).size.width,height: 10,decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15))),),bottom: 0,)
                  ],
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(8),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      isLoading
                          ? Shimmer.fromColors(
                              baseColor: Colors.grey.shade300,
                              highlightColor: Colors.grey.shade100,
                              child: const Spotlight(),
                            )
                          : const SizedBox(width: 110, child: Spotlight()),
                      const SizedBox(height: 5),
                      isLoading
                          ? Shimmer.fromColors(
                              baseColor: Colors.grey.shade300,
                              highlightColor: Colors.grey.shade100,
                              child: Container(
                                height: 20,
                                color: Colors.white,
                                width: double.infinity,
                              ),
                            )
                          : const Text(
                              'Stuffed Union',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30),
                            ),
                      const SizedBox(height: 15),
                      isLoading
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
                              trailing: const SizedBox(
                                  width: 110, child: DurationWidget()),
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(
                                  widget.item.creatorImage ?? '',
                                ),
                              ),
                              title: const Text('Prepared by'),
                              subtitle: Row(
                                children: [
                                  Text(
                                    widget.item.creatorName ?? '',
                                    maxLines: 1,
                                    style: const TextStyle(
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                  Icon(
                                    Icons.ios_share_outlined,
                                    color: Colors.grey.shade800,
                                  )
                                ],
                              ),
                            ),
                      const SizedBox(height: 10),
                      isLoading
                          ? Shimmer.fromColors(
                              baseColor: Colors.grey.shade300,
                              highlightColor: Colors.grey.shade100,
                              child: Container(
                                height: 50,
                                color: Colors.white,
                              ),
                            )
                          : TabsWidget(
                              selectedIndex: selected,
                              onSelect: (i) {
                                setState(() {
                                  selected = i;
                                });
                              },
                            ),
                      const SizedBox(height: 15),
                    ],
                  ),
                ),
              ),
              selected == 0 ? const IngredientsList() : const StepsList()
            ],
          );
        },
      ),
      bottomNavigationBar: selected == 1
          ? null
          : Container(
              padding: EdgeInsets.all(20),
              height: 90,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  DetailsButtonWidget(),
                  SizedBox(width: 10),
                  Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width / 1.25,
                    child: SingleTab(isSelected: true, text: 'text'),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
            ),
    );
  }
}



