import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:suprapp/app/core/constants/app_colors.dart';
import 'package:suprapp/app/core/constants/global_variables.dart';
import 'package:suprapp/app/features/dine_out/widgets/remove_fav_bottom_sheet.dart';
import 'package:suprapp/app/routes/go_router.dart';

class FavouriteRestaurentPage extends StatefulWidget {
  const FavouriteRestaurentPage({super.key});

  @override
  State<FavouriteRestaurentPage> createState() =>
      _FavouriteRestaurentPageState();
}

class _FavouriteRestaurentPageState extends State<FavouriteRestaurentPage> {
  final List<Map<String, dynamic>> data = [
    {
      'name': 'Press\'d',
      'subtitle': 'Ground Level, Polo Residence',
      'rating': 4.5,
      'image':
          'https://upload.wikimedia.org/wikipedia/commons/6/62/Barbieri_-_ViaSophia25668.jpg',
    },
    {
      'name': 'Urban Bites',
      'subtitle': 'Al Barsha, Dubai',
      'rating': 4.2,
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQL57-kIGC5qv12b-6JEq0am9RQmRnT1iHZZQ&s',
    },
    {
      'name': 'Green Bowl',
      'subtitle': 'Downtown Dubai, Dubai Mall',
      'rating': 4.8,
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTzmnuNE7Vg8_evlj5T85CKWArPluVly20wLw&s',
    },
    {
      'name': 'Cafe Bloom',
      'subtitle': 'Jumeirah Beach Road',
      'rating': 4.1,
      'image':
          'https://images.unsplash.com/photo-1682778418768-16081e4470a1?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cmVzdGF1cmFudCUyMGJhY2tncm91bmR8ZW58MHx8MHx8fDA%3D',
    },
    {
      'name': 'The Sizzle House',
      'subtitle': 'Marina Walk, Dubai Marina',
      'rating': 4.7,
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRSWGa7nz-J8ZfjAVxPSsPdXwLJw1ajyWAEmQ&s',
    },
    {
      'name': 'Tandoori Flames',
      'subtitle': 'Karama, Dubai',
      'rating': 4.3,
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZYzox8cw_TmfixXla85NzLjsMEwRhstuq1g&s',
    },
    {
      'name': 'The Noodle House',
      'subtitle': 'Sheikh Zayed Road',
      'rating': 4.4,
      'image':
          'https://images.unsplash.com/photo-1555243896-c709bfa0b564?auto=format&fit=crop&w=300&q=60',
    },
    {
      'name': 'Meat & More',
      'subtitle': 'Business Bay, Dubai',
      'rating': 4.6,
      'image':
          'https://media.istockphoto.com/id/1369561386/photo/having-a-great-lunch-and-time-with-you.jpg?s=612x612&w=0&k=20&c=2Gj9ChgYNzp3CK1zxRqJunu4oQHN8YkoOMBZyV6uXNw=',
    },
    {
      'name': 'Zaatar W Zeit',
      'subtitle': 'Al Quoz, Dubai',
      'rating': 4.0,
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIzd-M3sajCPoY-nXWH_KWNlRGhVcL7VDCVw&s',
    },
    {
      'name': 'Food Hall',
      'subtitle': 'Mall of the Emirates',
      'rating': 4.9,
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSj8L-vjust5NvQGP5gwsCI9u-zLPQ594P2TA&s',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              context.pop();
            },
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.appGrey),
                  borderRadius: BorderRadius.circular(7)),
              child: const Icon(
                Icons.arrow_back,
                color: AppColors.darkGrey,
                size: 20,
              ),
            ),
          ),
        ),
        title: Text(
          'Favourites',
          style: textTheme(context).titleLarge?.copyWith(
                color: colorScheme(context).onSurface,
                fontWeight: FontWeight.w600,
              ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                context.pushNamed(AppRoute.favouriteRestaurentPage);
              },
              child: Container(
                height: 50,
                width: 40,
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.appGrey),
                    borderRadius: BorderRadius.circular(7)),
                child: Icon(
                  Icons.view_agenda_outlined,
                  color: AppColors.darkGrey,
                  size: 16,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final item = data[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 3),
                          child: Container(
                            height: 75,
                            width: 75,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(item['image']),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                item['name'],
                                style: textTheme(context).bodyMedium?.copyWith(
                                      color: colorScheme(context).onSurface,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              Text(
                                item['subtitle'],
                                style: textTheme(context).bodySmall?.copyWith(
                                      color: colorScheme(context)
                                          .onSurface
                                          .withOpacity(0.6),
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              Row(
                                children: [
                                  Icon(Icons.star,
                                      color: Colors.orange, size: 16),
                                  SizedBox(width: 3),
                                  Text(
                                    item['rating'].toString(),
                                    style:
                                        textTheme(context).bodySmall?.copyWith(
                                              color: colorScheme(context)
                                                  .onSurface
                                                  .withOpacity(0.6),
                                              fontWeight: FontWeight.w600,
                                            ),
                                  ),
                                  SizedBox(width: 6),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 2),
                                      minimumSize: Size(0, 24),
                                      backgroundColor: Colors.green,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                    onPressed: () {},
                                    child: Text(
                                      "+ | 20% off",
                                      style: textTheme(context)
                                          .bodySmall
                                          ?.copyWith(
                                            color: AppColors.lightGreen,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.favorite,
                              size: 18, color: AppColors.appGreen),
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              builder: (context) =>
                                  const RemoveFavBottomSheet(),
                            );
                          },
                          padding: EdgeInsets.zero,
                          constraints: BoxConstraints(),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
