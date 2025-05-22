import 'package:flutter/material.dart';

class RestaurantDetailPage extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String location;
  final String price;
  final String tag;

  const RestaurantDetailPage({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.location,
    required this.price,
    required this.tag,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Carousel
            SizedBox(
              height: 250,
              child: PageView.builder(
                itemCount: 3, // Adjust based on available images
                itemBuilder: (context, index) => Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Restaurant Info
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.location_on, color: Colors.red),
                      const SizedBox(width: 4),
                      Expanded(child: Text(location)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text("Price per person: \$${price}"),
                  const SizedBox(height: 8),
                  Chip(label: Text(tag)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
