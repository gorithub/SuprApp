import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suprapp/app/core/constants/app_colors.dart';
import 'package:suprapp/app/core/constants/global_variables.dart';
import 'package:suprapp/app/features/dine_out/controller/state_controller.dart';
import 'package:suprapp/app/features/profile/widgets/custom_arrow_back.dart';
import 'package:suprapp/app/shared/widgets/custom_elevated_button.dart';

class CareemPlusScreen extends StatefulWidget {
  const CareemPlusScreen({super.key});

  @override
  State<CareemPlusScreen> createState() => _CareemPlusScreenState();
}

class _CareemPlusScreenState extends State<CareemPlusScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      final provider = Provider.of<AppBarProvider>(context, listen: false);
      if (_scrollController.offset > 100) {
        provider.setCollapsed(true);
      } else {
        provider.setCollapsed(false);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appBarProvider = Provider.of<AppBarProvider>(context);
    return Scaffold(
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 50,
            width: 80,
            child: Row(
              children: [
                const Icon(Icons.percent, size: 15),
                Text(
                  "Offer",
                  style: textTheme(context).labelLarge,
                ),
                const Icon(
                  Icons.keyboard_arrow_down_outlined,
                  size: 15,
                )
              ],
            ),
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              height: MediaQuery.of(context).size.height * 0.07,
              child:
                  CustomElevatedButton(text: "Subscribe Now", onPressed: () {}))
        ],
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
              pinned: true,
              floating: false,
              expandedHeight: 180,
              backgroundColor: appBarProvider.isCollapsed
                  ? Colors.white
                  : Theme.of(context).primaryColor,
              leading: const CustomArrowBack(),
              flexibleSpace: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                final isCollapsed = constraints.maxHeight <=
                    kToolbarHeight + MediaQuery.of(context).padding.top;

                return FlexibleSpaceBar(
                  title: isCollapsed
                      ? Text(
                          "Join Caream Plus",
                          style: textTheme(context)
                              .bodyLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        )
                      : null,
                  background: Container(
                    padding:
                        const EdgeInsets.only(top: 60, left: 16, right: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 10),
                        Text(
                          'Start saving today',
                          style: textTheme(context).bodyLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: colorScheme(context).onPrimary),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Caream+ ",
                          style: textTheme(context).displayLarge?.copyWith(
                              color: AppColors.brightGreen,
                              fontWeight: FontWeight.bold),
                        ),
                        Text('DineOut | Rides | Food | More',
                            style: textTheme(context).headlineSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: colorScheme(context).onPrimary)),
                        const SizedBox(height: 4),
                        Text(
                          'AED 15/month',
                          style: textTheme(context).bodyLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: colorScheme(context).onPrimary),
                        ),
                      ],
                    ),
                  ),
                );
              })),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: _buildBenefitTile(
                        title: 'Buy 1 Get 1 deals & more',
                        subtitle: 'Save across 800+ dining places',
                        badge: 'Featuring brunches, buffets, and more',
                        icon: Icons.restaurant_menu,
                      ),
                    ),
                  ),
                  const SizedBox(height: 80),
                  Text(
                    "Have a question",
                    style: textTheme(context)
                        .headlineSmall
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  customTile("Frequently asked questions", () {}),
                  customTile("T&Cs apply", () {})
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBenefitTile({
    required String title,
    required String subtitle,
    IconData? icon,
    String? badge,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading:
              Icon(Icons.check_circle, color: colorScheme(context).primary),
          title: Text(title,
              style: textTheme(context)
                  .bodyLarge
                  ?.copyWith(fontWeight: FontWeight.bold)),
          subtitle: Text(
            subtitle,
            style: textTheme(context).bodySmall,
          ),
        ),
        const SizedBox(width: 12),
        Align(
          alignment: Alignment.center,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.brightGreen.withOpacity(0.5),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              badge!,
              style: textTheme(context)
                  .bodySmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }

  Widget customTile(
    String title,
    VoidCallback onTpa,
  ) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        title,
        style:
            textTheme(context).bodyLarge?.copyWith(fontWeight: FontWeight.bold),
      ),
      trailing: const Icon(
        Icons.arrow_forward_outlined,
        size: 20,
      ),
      onTap: onTpa,
    );
  }
}
