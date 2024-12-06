import 'package:apollo_task_flutter/data/model/list_response.dart';
import 'package:apollo_task_flutter/presentation/providers/content_switch_provider.dart';
import 'package:apollo_task_flutter/presentation/providers/items_provider.dart';
import 'package:apollo_task_flutter/presentation/theme.dart';
import 'package:apollo_task_flutter/presentation/widgets/home/duration_widget.dart';
import 'package:apollo_task_flutter/presentation/widgets/home/grid_item.dart';
import 'package:apollo_task_flutter/presentation/widgets/home/spotlight.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart'; // Import shimmer package
import 'package:video_player/video_player.dart';
import '../../widgets/details/bottom_details_widget.dart';
import '../../widgets/details/details_app_bar.dart';
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
  ChewieController? chewieController;
  VideoPlayerController? videoPlayerController;

  getDetails(BuildContext context) {
    Future.delayed(Duration.zero).then(
      (value) {
        Provider.of<ItemsProvider>(context, listen: false).getDetails();
      },
    );
  }

  initVideoPlayer() async {
    if (widget.item.additionalInfo!.videoLink == null) {
      return;
    }

    videoPlayerController = VideoPlayerController.networkUrl(
        Uri.parse(widget.item.additionalInfo!.videoLink!));

    await videoPlayerController!.initialize();

    setState(() {
      chewieController = ChewieController(
        videoPlayerController: videoPlayerController!,
        autoPlay: true,
        looping: true,
      );
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    initVideoPlayer();
    getDetails(context);
  }

  @override
  void dispose() {
    if (videoPlayerController != null) {
      videoPlayerController!.dispose();
    }
    if (chewieController != null) {
      chewieController!.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<ItemsProvider>(
          builder: (context, value, child) {
            // Check if data is loading
            bool isLoading = value.isLoading;
            String name = widget.item.name ?? '';

            return CustomScrollView(
              slivers: [
                DetailsAppBar(
                    item: widget.item,
                    isLoading: isLoading,
                    chewieController: chewieController),
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
                            : Text(
                                name,
                                style: const TextStyle(
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
                            : Consumer<ContentSwitchProvider>(
                                builder: (context, navProvider, child) =>
                                    TabsWidget(
                                  selectedIndex: navProvider.selectedTab,
                                  onSelect: (i) {
                                    navProvider
                                        .selectTab(int.parse(i.toString()));
                                  },
                                ),
                              ),
                        const SizedBox(height: 15),
                      ],
                    ),
                  ),
                ),
                Consumer<ContentSwitchProvider>(
                  builder: (context, navProvider, child) =>
                      navProvider.selectedTab == 0
                          ? const IngredientsList()
                          : const StepsList(),
                )
              ],
            );
          },
        ),
        bottomNavigationBar: Consumer<ContentSwitchProvider>(
          builder: (context, navProvider, child) => navProvider.selectedTab == 1
              ? Container(
                  height: 0,
                )
              : const BottomDetailsWidget(),
        ));
  }
}
