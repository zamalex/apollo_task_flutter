import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: false,
            pinned: true,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                  'https://i1.sndcdn.com/artworks-000305864466-aicx3c-t240x240.jpg',width: double.infinity,height: double.infinity,fit: BoxFit.cover,)
            ),
          ),

          SliverPadding(
            padding: EdgeInsets.all(8),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(

                    decoration: BoxDecoration(
                      color: Colors.greenAccent
                    ),
                    child: Row(children: [
                      Icon(Icons.abc),
                      Text('data')
                    ],),
                  ),

                  Text('Stuffed Union',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),

                  ListTile(
                    title: Text('data'),
                    leading: CircleAvatar(),
                    subtitle: Row(),
                  )
                ],
              ),
            ),
          )
        ],
      ),

      bottomNavigationBar: Container(
        height: 200,
        decoration: BoxDecoration(color: Colors.white),
      child: ListView(
        scrollDirection:Axis.horizontal,
        children: [],
      ),
      )
      ,
    );
  }
}
