import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:suprapp/app/core/constants/app_colors.dart';
import 'package:suprapp/app/core/constants/global_variables.dart';
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
      'subtitle': 'Ground Level, Polo Residence Nad Al\nSheba',
      'rating': 4.5,
      'image':
          'https://images.unsplash.com/photo-1600891964599-f61ba0e24092?auto=format&fit=crop&w=300&q=60',
    },
    {
      'name': 'Urban Bites',
      'subtitle': 'Al Barsha, Dubai',
      'rating': 4.2,
      'image':
          'https://images.unsplash.com/photo-1555992336-03a23c5f177c?auto=format&fit=crop&w=300&q=60',
    },
    {
      'name': 'Green Bowl',
      'subtitle': 'Downtown Dubai, Dubai Mall',
      'rating': 4.8,
      'image':
          'https://images.unsplash.com/photo-1523986371872-9d3ba2e2f642?auto=format&fit=crop&w=300&q=60',
    },
    {
      'name': 'Cafe Bloom',
      'subtitle': 'Jumeirah Beach Road',
      'rating': 4.1,
      'image':
          'https://images.unsplash.com/photo-1586190848861-99aa4a171e90?auto=format&fit=crop&w=300&q=60',
    },
    {
      'name': 'The Sizzle House',
      'subtitle': 'Marina Walk, Dubai Marina',
      'rating': 4.7,
      'image':
          'https://images.unsplash.com/photo-1600891965059-4d47cfa8fc17?auto=format&fit=crop&w=300&q=60',
    },
    {
      'name': 'Tandoori Flames',
      'subtitle': 'Karama, Dubai',
      'rating': 4.3,
      'image':
          'https://images.unsplash.com/photo-1600891964603-82b6c2f1dc1c?auto=format&fit=crop&w=300&q=60',
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
          'https://images.unsplash.com/photo-1600891964539-6b5f2c0b3fc1?auto=format&fit=crop&w=300&q=60',
    },
    {
      'name': 'Zaatar W Zeit',
      'subtitle': 'Al Quoz, Dubai',
      'rating': 4.0,
      'image':
          'https://images.unsplash.com/photo-1551782450-a2132b4ba21d?auto=format&fit=crop&w=300&q=60',
    },
    {
      'name': 'Food Hall',
      'subtitle': 'Mall of the Emirates',
      'rating': 4.9,
      'image':
          'https://images.unsplash.com/photo-1528605248644-14dd04022da1?auto=format&fit=crop&w=300&q=60',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: Column(
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(item['image']),
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['name'],
                            style: textTheme(context).bodyLarge?.copyWith(
                                  color: colorScheme(context).onSurface,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          Text(
                            item['subtitle'],
                            style: textTheme(context).bodyMedium?.copyWith(
                                  color: colorScheme(context)
                                      .onSurface
                                      .withOpacity(0.6),
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.orange, size: 26),
                              SizedBox(width: 4),
                              Text(
                                item['rating'].toString(),
                                style: textTheme(context).bodyLarge?.copyWith(
                                      color: colorScheme(context)
                                          .onSurface
                                          .withOpacity(0.6),
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              SizedBox(width: 8),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(80, 24),
                                  backgroundColor: Colors.green,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 0),
                                ),
                                onPressed: () {},
                                child: Text(
                                  "+ | 20 % off",
                                  style:
                                      textTheme(context).bodyMedium?.copyWith(
                                            color: AppColors.lightGreen,
                                            fontWeight: FontWeight.w600,
                                          ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Spacer(),
                      IconButton(
                        icon: Icon(
                          Icons.favorite,
                          size: 20,
                          color: AppColors.appGreen,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
