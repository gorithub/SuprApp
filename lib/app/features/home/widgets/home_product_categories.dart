import 'package:flutter/material.dart';
import 'package:suprapp/app/core/constants/global_variables.dart';

class HomeProductCategories extends StatelessWidget {
  const HomeProductCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Popular Categories',
            style: textTheme(
              context,
            ).headlineSmall?.copyWith(
                fontWeight: FontWeight.bold, color: Color(0xff0A0C0B)),
          ),
          SizedBox(
            height: 200,
            child: PageView.builder(
              itemBuilder: (context, index) {
                return Container(
                  width: 250,
                  margin: EdgeInsets.symmetric(vertical: 16, horizontal: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: AssetImage("assets/vr_background.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        bottom: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                colorScheme(context).secondary.withAlpha(
                                      1,
                                    ), // Fading color (black)
                                Colors.transparent, // Transparent at the top
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              stops: const [
                                0.0,
                                0.3,
                                0.6,
                                1.0
                              ], // Adjusted stops for smoother transition
                              colors: [
                                Colors.transparent,
                                Colors.transparent,
                                colorScheme(context).secondary.withOpacity(
                                    0.1), // Lower opacity for smoother fade
                                colorScheme(context).secondary.withOpacity(
                                    0.3), // Lower opacity for smoother fade
                              ],
                            ),
                          ),
                        ),
                      ),
                      // Centered Text on top of the image
                      Positioned(
                        bottom: 15,
                        left: 20,
                        child: Text(
                          'Essential for Gaming',
                          style: textTheme(context).titleMedium?.copyWith(
                              color: colorScheme(context).onSecondary,
                              fontWeight: FontWeight.w600),
                        ),
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
