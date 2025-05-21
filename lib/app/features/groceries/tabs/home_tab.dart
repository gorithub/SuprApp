import 'package:flutter/material.dart';
import 'package:suprapp/app/features/groceries/widgets/product_section.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    final liquid = [
      {
        'title': 'Omo Active Detergent Liquid 2L',
        'price': 'AED 25.99',
        'discount': '-9%',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTrW9Qy1nHncu5WHJXEY2I2JIpueTABoNECSg&s',
      },
      {
        'title': 'Persil Power Gel 1.8L Bottle',
        'price': 'AED 13.85',
        'discount': '-8%',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ2aXS30K99TzMGusaWRnomD9lzOpH3USnMwQ&s',
      },
      {
        'title': 'Ariel Detergent Liquid 2.5L',
        'price': 'AED 19.95',
        'discount': '-15%',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4cH0C7XJEQrVV2nzJ-9FrqA8cD0Z2TaMg8w&s',
      },
    ];

    final powder = [
      {
        'title': 'Ariel Original Detergent Powder 2.5kg',
        'price': 'AED 19.20',
        'old': 'AED 24',
        'discount': '-20%',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQajfjQ7QBehnOBrEorTgSmy7w0cm5Cfa2_Kg&s',
      },
      {
        'title': 'Tide Automatic Detergent Powder 2.25kg',
        'price': 'AED 19.20',
        'old': 'AED 24',
        'discount': '-20%',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrpAAGUY5twxqKYY0-TiyyEfpT9x4Stg-w4w&s',
      },
      {
        'title': 'Omo Washing Powder Comfort 2.5kg',
        'price': 'AED 25.90',
        'old': 'AED 30.45',
        'discount': '-15%',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxvZBmtZn7h7gIpUNEuTCSRGDMj-mAH6mKCA&s',
      },
    ];

    final tabs = [
      {
        'title': 'Finish Powerball Dishwasher Tabs (20 pcs)',
        'price': 'AED 3.50',
        'old': 'AED 4.00',
        'discount': '-12%',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSrX1lI7ToaPINYCMPVfOzG2MmSaFE8WvXIw&s',
      },
      {
        'title': 'Fairy Platinum Plus All-in-One Tabs (15 pcs)',
        'price': 'AED 6.25',
        'old': 'AED 7.00',
        'discount': '-11%',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUeyUC3ZGWQ-ao3kX_WVRdX6K7vHLIqFML7A&s',
      },
      {
        'title': 'Somat Gold Dishwasher Tabs (18 pcs)',
        'price': 'AED 8.00',
        'old': 'AED 9.50',
        'discount': '-16%',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQSNCfMVCrWjtuT3idUdRlkS93EA058i1HgJA&s',
      },
    ];

    final surfaceCleaners = [
      {
        'title': 'Dettol Surface Cleaner 1L',
        'price': 'AED 18.00',
        'old': 'AED 22.00',
        'discount': '-18%',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQBA_5tGd8AqriWNeJuHb3GtpgwDg6wKNjxpw&s',
      },
      {
        'title': 'Harpic Disinfectant 750ml',
        'price': 'AED 10.00',
        'old': 'AED 14.00',
        'discount': '-29%',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTcZRHlI-ClWHzDZJWLM6KXzAEOt0bRnaMHA&s',
      },
      {
        'title': 'Lysol Multi-Surface Cleaner 1.2L',
        'price': 'AED 30.00',
        'old': 'AED 35.00',
        'discount': '-14%',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSsRe79X6JQY2iMOWtYQfWColOJKIi2PiXLOA&s',
      },
    ];

    final stainRemover = [
      {
        'title': 'Vanish Oxi Action Powder 500g',
        'price': 'AED 5.00',
        'old': 'AED 10.00',
        'discount': '-50%',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS2tBFi8uRkBdYEyV8aJlZXTKaUaKBlryl93A&s',
      },
      {
        'title': 'Clorox Stain Remover Spray 500ml',
        'price': 'AED 12.00',
        'old': 'AED 18.00',
        'discount': '-33%',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQPUhWvDhljI-H8gL-HMwesod0ohioOlTKodQ&s',
      },
      {
        'title': 'Tide To Go Instant Stain Remover',
        'price': 'AED 3.00',
        'old': 'AED 6.00',
        'discount': '-50%',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSUpyqG543y5xyOnXgq7SBOaKwUlkIYEFmIyg&s',
      },
    ];

    final fabricSoftners = [
      {
        'title': 'Comfort Fabric Softener Blue 1L',
        'price': 'AED 4.25',
        'old': 'AED 5.00',
        'discount': '-15%',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTo8XrC4NRGPNfV83R5BxqYtvg8xNskiTInTg&s',
      },
      {
        'title': 'Downy Garden Bloom Softener 1.5L',
        'price': 'AED 9.99',
        'old': 'AED 12.00',
        'discount': '-17%',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT4wN9kURbrFyfm-JHH0xjHv4ZmITHw9_N46Q&s',
      },
      {
        'title': 'Sta-Soft Spring Fresh 500ml',
        'price': 'AED 2.50',
        'old': 'AED 3.00',
        'discount': '-16%',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQFOHQ6Ol8uzEizfOg_PK6NM6jzrFmDTyAjjg&s',
      },
    ];

    return Scaffold(
      body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductSection(
                title: 'Detergent liquid',
                products: liquid,
                isHerbal: false,
              ),
              const SizedBox(
                height: 20,
              ),
              ProductSection(
                title: 'Detergent powder',
                products: powder,
                isHerbal: true,
                onSectionTap: () {},
              ),
              const SizedBox(
                height: 20,
              ),
              ProductSection(
                title: 'Detergent tabs',
                products: tabs,
                isHerbal: false,
                onSectionTap: () {},
              ),
              const SizedBox(
                height: 20,
              ),
              ProductSection(
                title: 'Fabric softners',
                products: fabricSoftners,
                isHerbal: false,
                onSectionTap: () {},
              ),
              const SizedBox(
                height: 20,
              ),
              ProductSection(
                title: 'Stain Removers',
                products: stainRemover,
                isHerbal: false,
                onSectionTap: () {},
              ),
              const SizedBox(
                height: 20,
              ),
              ProductSection(
                title: 'Bleach & Starch',
                products: powder,
                isHerbal: true,
                onSectionTap: () {},
              ),
              const SizedBox(
                height: 20,
              ),
              ProductSection(
                title: 'Surface Cleaners',
                products: surfaceCleaners,
                isHerbal: true,
                onSectionTap: () {},
              ),
              const SizedBox(
                height: 20,
              ),
              ProductSection(
                title: 'Cleaning Materials',
                products: fabricSoftners,
                isHerbal: false,
                onSectionTap: () {},
              ),
              const SizedBox(
                height: 20,
              ),
              ProductSection(
                title: 'Dish Cleaners',
                products: stainRemover,
                isHerbal: false,
                onSectionTap: () {},
              ),
              const SizedBox(
                height: 20,
              ),
              ProductSection(
                title: 'Bathroom Cleaners',
                products: surfaceCleaners,
                isHerbal: true,
                onSectionTap: () {},
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          )),
    );
  }
}
