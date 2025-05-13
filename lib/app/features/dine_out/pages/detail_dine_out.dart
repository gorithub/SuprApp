import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suprapp/app/core/constants/global_variables.dart';
import 'package:suprapp/app/features/dine_out/controller/dine_out_provider.dart';
import 'package:suprapp/app/features/dine_out/controller/filter_controller.dart';
import 'package:suprapp/app/features/dine_out/widgets/customTabController.dart';
import 'package:suprapp/app/features/dine_out/widgets/filterwidget.dart';

class DetailDineOut extends StatelessWidget {
  final int parentIndex;
  const DetailDineOut({super.key, required this.parentIndex});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DineOutProvider>(context);
    final nestedItem = provider.getItemByIndex(parentIndex);

    final filters = context.watch<FilterProvider>().allFilters;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: false,
              titlePadding: const EdgeInsets.all(16),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    nestedItem.title,
                    style: textTheme(context).labelLarge?.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Handpicked spots taht have recieved a lot of love lately!!",
                    style: textTheme(context)
                        .labelSmall
                        ?.copyWith(color: Colors.white, fontSize: 8),
                  ),
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined,
                          size: 10, color: colorScheme(context).onPrimary),
                      Text(
                        "15 restaurants",
                        style: textTheme(context)
                            .labelSmall
                            ?.copyWith(color: Colors.white, fontSize: 7),
                      ),
                    ],
                  ),
                ],
              ),
              background: Image.asset(
                nestedItem.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                            margin: const EdgeInsets.only(right: 8),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: colorScheme(context)
                                      .onSurface
                                      .withOpacity(0.3)),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(Icons.filter_alt_outlined,
                                size: 16)),
                        ...filters.map((f) => FilterButton(label: f)).toList(),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.5,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: nestedItem.anotherDiscription.length,
                        itemBuilder: (context, index) {
                          final discription =
                              nestedItem.anotherDiscription[index];
                          final List<String> imageUrls = discription.image
                              .expand((img) => [
                                    img.image1,
                                    img.image2,
                                    img.image3,
                                    img.image4,
                                    img.image5,
                                    img.image6,
                                    img.image7,
                                    img.image8,
                                  ])
                              .toList();

                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: customContainer(context, imageUrls),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget customContainer(
    BuildContext context,
    List<String> images,
  ) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width * 0.3,
      child: DefaultTabController(
        length: images.length,
        child: Builder(
          builder: (context) {
            final TabController tabController =
                DefaultTabController.of(context);

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 159,
                  child: Stack(
                    children: [
                      TabBarView(
                        controller: tabController,
                        children: images.map((imgPath) {
                          return Image.asset(
                            imgPath,
                            cacheHeight: 150,
                            cacheWidth: 500,
                            fit: BoxFit.cover,
                          );
                        }).toList(),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomTabPageSelector(
                            controller: tabController,
                            selectedColor: Colors.white,
                            unselectedColor: Colors.grey.shade300,
                            width: 10,
                            height: 5,
                            borderRadius: 6,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
