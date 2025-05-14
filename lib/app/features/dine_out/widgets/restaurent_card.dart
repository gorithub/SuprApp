import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:suprapp/app/core/constants/app_colors.dart';

import '../../../core/constants/global_variables.dart';

class RestaurantCard extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String location;
  final String price;
  final String tag;
  const RestaurantCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.location,
    required this.price,
    required this.tag,
  });

  @override
  State<RestaurantCard> createState() => _RestaurantCardState();
}

class _RestaurantCardState extends State<RestaurantCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(
              imageUrl: widget.imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.fill,
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.title,
                        style: GoogleFonts.raleway(
                            color: colorScheme(context).onSurface,
                            fontSize: 16,
                            fontWeight: FontWeight.w700)),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                      },
                      child: CircleAvatar(
                        backgroundColor: AppColors.appGreen.withOpacity(0.2),
                        child: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_outline,
                          color: isFavorite
                              ? AppColors.appGreen
                              : AppColors.appGreen.withOpacity(0.9),
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: AppColors.appOrange,
                      size: 20,
                    ),
                    const SizedBox(width: 10),
                    Text(widget.location,
                        style: GoogleFonts.poppins(
                            color:
                                colorScheme(context).onSurface.withOpacity(0.5),
                            fontSize: 13,
                            fontWeight: FontWeight.w500)),
                  ],
                ),
                const SizedBox(height: 4),
                Text(widget.price,
                    style: GoogleFonts.poppins(
                        color: colorScheme(context).onSurface.withOpacity(0.5),
                        fontSize: 13,
                        fontWeight: FontWeight.w500)),
                const SizedBox(height: 8),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                  decoration: BoxDecoration(
                    color: AppColors.appGreen,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(' Supr + | 10% Off on La-carte',
                      style: GoogleFonts.poppins(
                          color: colorScheme(context).surface,
                          fontSize: 10,
                          fontWeight: FontWeight.w400)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
