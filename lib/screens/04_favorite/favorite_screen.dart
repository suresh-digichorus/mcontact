import 'package:flutter/material.dart';
import 'package:mcontact/themes/colors.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        SliverAppBar(
          snap: true,
          floating: true,
          pinned: true,
          centerTitle: true,
          expandedHeight: 150,
          actions: const [
            // Image.asset(
            //   Images.logo,
            //   width: 100,
            // ),
          ],
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('data'),
            ],
          ),
          bottom: PreferredSize(
            preferredSize: const Size(double.infinity, 50),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                'Favorite',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: AppColors.white,
                    ),
              ),
            ),
          ),
        )
      ],
      body: SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
