import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:suprapp/app/core/constants/global_variables.dart';
import 'package:suprapp/app/features/home/widgets/custom_icon_button.dart';
import 'package:suprapp/app/features/home/widgets/top_sheet.dart';
import 'package:suprapp/app/shared/widgets/custom_elevated_button.dart';

import '../../../core/constants/app_images.dart';

class HomeHeader extends StatelessWidget {
  HomeHeader({super.key});
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(35)),
        gradient: LinearGradient(
          colors: [
            Color(0xFFFFF3D9),
            Color(0xFFD0F4C4),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,

            // spacing: 16,
            children: [
              Row(
                children: [
                  Image.asset(
                    "assets/app_logo.png",
                    height: 30,
                    width: 70,
                  ),
                  Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: CustomElevatedButton(
                      borderRadius: 30,
                      buttonColor: colorScheme(context).secondary,
                      padding: EdgeInsets.all(0),
                      width: 70,
                      height: 30,
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => ComingSoonPage()),
                        // );
                      },
                      text: 'Pay',
                      textStyle: textTheme(context).bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: colorScheme(context).onSurface,
                          ),
                    ),
                  ),
                  SizedBox(width: 4),
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                      borderRadius:
                          BorderRadius.circular(30), // Match button radius
                    ),
                    child: CustomIconButton(
                      height: 30,
                      width: 30,
                      iconSize: 18,
                      borderRadius: 30,
                      icon: Icons.menu,
                      iconColor: colorScheme(context).onSurface,
                      buttonColor: colorScheme(context).secondary,
                      onPressed: () {
                        showGeneralDialog(
                          context: context,
                          barrierDismissible: true,
                          barrierLabel: 'TopSheet',
                          transitionDuration: const Duration(milliseconds: 300),
                          pageBuilder: (_, __, ___) => const SizedBox.shrink(),
                          transitionBuilder: (_, animation, __, ___) {
                            return SlideTransition(
                              position: Tween<Offset>(
                                begin: const Offset(0, -1),
                                end: Offset.zero,
                              ).animate(animation),
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: const TopSheetWidget(),
                              ),
                            );
                          },
                        );
                      },
                      padding: EdgeInsets.all(0),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                'The Everything App',
                style: textTheme(context).displayMedium?.copyWith(
                    color: colorScheme(context).primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: searchController,
                style:
                    GoogleFonts.poppins(fontSize: 13, color: Color(0xff000000)),
                decoration: InputDecoration(
                  hintText: 'Search what you need',
                  hintStyle: GoogleFonts.poppins(
                      fontSize: 13, color: Color(0xff000000)),
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: Colors.green),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                // spacing: 12,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Supr Pay balance',
                          style: textTheme(context).bodySmall!.copyWith(
                                fontWeight: FontWeight.w500,
                                color: colorScheme(context).onSurface,
                              )),
                      Text('0 INR',
                          style: textTheme(context).bodySmall!.copyWith(
                                fontWeight: FontWeight.w600,
                                color: colorScheme(context).onSurface,
                              )),
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: 1,
                    height: 30,
                    color: colorScheme(context).onSurface,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Offers for you',
                          style: textTheme(context).bodySmall!.copyWith(
                                fontWeight: FontWeight.w500,
                                color: colorScheme(context).onSurface,
                              )),
                      Text('0',
                          style: textTheme(context).bodySmall!.copyWith(
                                fontWeight: FontWeight.w600,
                                color: colorScheme(context).onSurface,
                              )),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppIcon.locationIcon),
                  SizedBox(
                    width: 5,
                  ),
                  Text('Deliver to Delhi Ncr,1100',
                      style: textTheme(context).bodyMedium!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: colorScheme(context).onSurface,
                          )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
