import 'package:apollo_task_flutter/presentation/providers/items_provider.dart';
import 'package:apollo_task_flutter/presentation/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart'; // Import shimmer package

import '../../widgets/home/grid_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  getHomeRecipes(BuildContext context){

    Future.delayed(Duration.zero).then((value) {
      Provider.of<ItemsProvider>(context, listen: false).getItems();

    },);
  }

  @override
  Widget build(BuildContext context) {

    getHomeRecipes(context);

    return Scaffold(
      backgroundColor: AppTheme.kGreyColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 0,
            expandedHeight: 100,
            floating: false,
            pinned: true,
            backgroundColor: AppTheme.kHomeBackgroundColor,
            flexibleSpace: FlexibleSpaceBar(
              expandedTitleScale: 1.2,
              titlePadding: EdgeInsets.zero,
              title: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/rabbit.png'),
                ),
                title: Text(
                  'Rabbit Recipes',
                  style: TextStyle(fontWeight: FontWeight.bold, color: AppTheme.kPrimaryColor),
                ),
                subtitle: Text(
                  'Get it fast, make it faster',
                  style: TextStyle(fontSize: 11, color: AppTheme.kPrimaryColor),
                ),
                trailing: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.close,
                    color: AppTheme.kPrimaryColor,
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: Consumer<ItemsProvider>(
              builder: (context, value, child) {
                bool isLoading = value.isLoading;

                return SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                        (context, index) {
                      return isLoading
                          ? Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        child: Container(
                          color: Colors.white,
                          margin: EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Container(
                                height: 120,
                                color: Colors.grey.shade300,
                              ),
                              SizedBox(height: 10),
                              Container(
                                height: 20,
                                color: Colors.grey.shade300,
                              ),
                            ],
                          ),
                        ),
                      )
                          : GridItem(item: value.items[index]);
                    },
                    childCount: isLoading ? 6 : value.items.length, // Show shimmer for 6 items while loading
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: .6,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
