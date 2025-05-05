import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CongratulationsContainer extends StatelessWidget {
  const CongratulationsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // soft black shadow
            offset: const Offset(0, 4), // only bottom side
            blurRadius: 6,
            spreadRadius: 1,
          ),
        ],
        gradient: LinearGradient(
          colors: [
            Color(0xFFFFF3D9),
            Color(0xFFD0F4C4).withOpacity(0.8),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              height: 80,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 35),
              child: Image.asset(
                'assets/images/car_background.png',
                fit: BoxFit.fill,
              )),
          SizedBox(
            height: 15,
          ),
          Text(
            'Congratulations!',
            style: GoogleFonts.poppins(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color(0xff000000),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Exclusive discounts just for you',
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: Color(0xff000000),
            ),
          ),
          const SizedBox(height: 30),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              _buildBox('Fashion', 'assets/images/fashion.png'),
              _buildBox('Food\nDelivery', 'assets/images/foodDelievry.png'),
              _buildBox('Budget\nDine in', 'assets/images/budgetDine.png'),
              _buildBox('Discount\nStore', 'assets/images/discountStore.png'),
            ],
          ),
          const SizedBox(height: 40),
          Container(
            width: double.infinity,
            height: 50,
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 5,
                ),
              ],
            ),
            child: TextButton(
              onPressed: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => ComingSoonPage()));
              },
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'View all Supr Plus benefits',
                    style: GoogleFonts.poppins(
                      color: Color(0xff393939),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.black87,
                    size: 30,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Widget _buildBox(String title, String imagePath) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Outer container with gradient border
        Container(
          width: 140 + 3, // Add padding size for border thickness
          height: 140 + 3, // Add padding size for border thickness
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              colors: [
                Color(0xFFFFDD00),
                Color(0xFF998500),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        Container(
          width: 140,
          height: 140,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Image.asset(
                  imagePath,
                  width: 70,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
