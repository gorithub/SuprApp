import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:suprapp/app/core/constants/app_colors.dart';
import 'package:suprapp/app/core/constants/global_variables.dart';
import 'package:suprapp/app/features/dine_out/controller/filter_controller.dart';
import 'package:suprapp/app/features/dine_out/provider/filter_provider.dart';
import 'package:suprapp/app/routes/go_router.dart';
import 'package:suprapp/app/shared/widgets/custom_elevated_button.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget({super.key});

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  final List<String> sortOptions = [
    'Recommended',
    'Offers: high → low',
    'Distance: near → far',
    'Rating: high → low',
    'Cost: high → low',
    'Cost: low → high',
  ];
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FilterProviders>(context);
    final selectedSortIndex = provider.selectedSortIndex;
    final isOffersSelected = provider.isOffersSelected;
    final isFilterActive = provider.isAnythingSelected;
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
          'Filters',
          style: textTheme(context).titleMedium?.copyWith(
                color: colorScheme(context).onSurface,
                fontWeight: FontWeight.w600,
              ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.appGrey,
                border: isFilterActive
                    ? Border.all(color: Colors.grey.shade400)
                    : Border.all(color: Colors.transparent),
                borderRadius: BorderRadius.circular(8),
              ),
              child: GestureDetector(
                onTap: isFilterActive ? provider.clearAll : null,
                child: Text(
                  "Clear all",
                  style: textTheme(context).bodyLarge?.copyWith(
                        color: isFilterActive
                            ? colorScheme(context).onSurface
                            : AppColors.darkGrey,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            Text(
              "Sort by",
              style: textTheme(context).titleMedium?.copyWith(
                    color: colorScheme(context).onSurface,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: 16),
            ...List.generate(sortOptions.length, (index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  children: [
                    if (sortOptions[index].contains("Offers"))
                      _offersChip()
                    else
                      const SizedBox(width: 40),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(sortOptions[index],
                          style: const TextStyle(fontSize: 16)),
                    ),
                    Radio<int>(
                      value: index,
                      groupValue: selectedSortIndex,
                      onChanged: (value) {
                        provider.selectSort(value!);
                      },
                      activeColor: Colors.black,
                    ),
                  ],
                ),
              );
            }),
            const Divider(
              height: 32,
              color: AppColors.appGrey,
            ),
            Text(
              "Quick Selection",
              style: textTheme(context).titleMedium?.copyWith(
                    color: colorScheme(context).onSurface,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                _offersChip(),
                const SizedBox(width: 8),
                const Text("Offers", style: TextStyle(fontSize: 16)),
                const Spacer(),
                Checkbox(
                  value: isOffersSelected,
                  onChanged: (_) {
                    provider.toggleOffers();
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ],
            ),
            const Spacer(),
            CustomElevatedButton(
              text: 'Show All restaurants',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _squareIconButton(IconData icon) {
    return Container(
      width: 42,
      height: 42,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(icon, size: 20),
    );
  }

  Widget _offersChip() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.green.shade800,
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("🤩", style: TextStyle(color: Colors.white, fontSize: 16)),
          SizedBox(width: 4),
          Icon(Icons.add, size: 16, color: Colors.white),
        ],
      ),
    );
  }
}
