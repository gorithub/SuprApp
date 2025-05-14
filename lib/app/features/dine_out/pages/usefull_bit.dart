import 'package:flutter/material.dart';
import 'package:suprapp/app/core/constants/global_variables.dart';
import 'package:suprapp/app/features/profile/widgets/custom_arrow_back.dart';

class FiliCafeDetails extends StatefulWidget {
  const FiliCafeDetails({super.key});

  @override
  State<FiliCafeDetails> createState() => _FiliCafeDetailsState();
}

class _FiliCafeDetailsState extends State<FiliCafeDetails>
    with TickerProviderStateMixin {
  late TabController _tabController;
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _foodKey = GlobalKey();
  final GlobalKey _beveragesKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    if (_tabController.indexIsChanging) return;
    final context = _tabController.index == 0
        ? _foodKey.currentContext
        : _beveragesKey.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(context,
          duration: const Duration(milliseconds: 300));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: const CustomArrowBack(),
        title: Text(
          "Usefull bits",
          style: textTheme(context)
              .bodyLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight - 10),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Align(
              alignment: Alignment.topLeft,
              child: TabBar(
                controller: _tabController,
                labelColor: Colors.black,
                indicatorColor: Colors.teal,
                dividerColor: Colors.white,
                indicatorPadding: const EdgeInsets.symmetric(horizontal: 5),
                isScrollable: true,
                labelPadding: const EdgeInsets.symmetric(horizontal: 10),
                tabs: const [
                  Tab(text: 'About'),
                  Tab(text: 'Amenities'),
                  Tab(text: 'House rules'),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Filli Cafe - Al Karamah',
                style: textTheme(context)
                    .headlineMedium
                    ?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(
              'Cafe',
              style: textTheme(context)
                  .bodySmall
                  ?.copyWith(color: Colors.black.withOpacity(0.4)),
            ),
            const Divider(
              color: Color.fromARGB(255, 214, 212, 212),
            ),
            Text(
              'Any time is tea time! This is your go-to casual hangout spot - hop in for a hot brew and crispy samosas! Whether you\'re here to work, read a book, or just spill the tea with friends, this is your perfect evening place to sip and yap. You’re probably a fan of Zafraan Coco Tea, and if not, it’s time to be. The setting is simple - benches, chairs, and good vibes. So, grab a seat for steaming hot samosas, chai, and endless chats!',
              style: textTheme(context)
                  .labelMedium
                  ?.copyWith(color: Colors.black.withOpacity(0.6)),
            ),
            const SizedBox(height: 10),
            Text(
              "Amenities",
              style: textTheme(context)
                  .bodyLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const Divider(
              color: Color.fromARGB(255, 214, 212, 212),
            ),
            const SizedBox(height: 10),
            buildAmenity(Icons.event_seat_outlined, 'Indoor Seating'),
            const SizedBox(height: 10),
            buildAmenity(Icons.accessible, 'Wheelchair Accessible'),
            const SizedBox(height: 10),
            buildAmenity(Icons.local_parking_outlined,
                'Parking Available (Paid, Outdoor/Street)'),
            const SizedBox(height: 10),
            buildAmenity(Icons.wb_sunny_outlined, 'Outdoor Seating'),
            const SizedBox(height: 10),
            buildAmenity(
                Icons.sentiment_satisfied_alt_outlined, 'Kid Friendly'),
            const SizedBox(height: 10),
            Text(
              "House Rules",
              style: textTheme(context)
                  .bodyLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const Divider(
              color: Color.fromARGB(255, 214, 212, 212),
            ),
            const SizedBox(height: 10),
            buildAmenity(Icons.checkroom, 'Dress Code: Casual'),
            const SizedBox(height: 10),
            buildAmenity(
                Icons.sentiment_satisfied_alt_outlined, 'Family Friends'),
          ],
        ),
      ),
    );
  }

  Widget buildAmenity(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: textTheme(context)
                  .bodyMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}
