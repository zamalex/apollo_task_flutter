import 'package:apollo_task_flutter/presentation/providers/items_provider.dart';
import 'package:apollo_task_flutter/presentation/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/home/grid_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});



  @override
  Widget build(BuildContext context) {
    Provider.of<ItemsProvider>(context,listen: false).getItems();

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
                title: Text('Rabbit Recipes',style: TextStyle(fontWeight: FontWeight.bold,color: AppTheme.kPrimaryColor),),
                subtitle: Text('Get it fast, make it faster',style: TextStyle(fontSize: 11,color: AppTheme.kPrimaryColor),),
                trailing: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.close,color:AppTheme.kPrimaryColor,),
                ),
              ),
            ),
          ),
          SliverPadding(

            padding: const EdgeInsets.all(8.0),
            sliver: Consumer<ItemsProvider>(
              builder: (context, value, child) =>  SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => GridItem(item: value.items[index],),

                  childCount: value.items.length
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: .7,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8),
              ),
            ),
          )
        ],
      ),
    );
  }
}
