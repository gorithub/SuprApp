import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:go_router/go_router.dart';
import 'package:suprapp/app/core/constants/app_colors.dart';
import 'package:suprapp/app/core/constants/app_images.dart';
import 'package:suprapp/app/core/constants/global_variables.dart';
import 'package:suprapp/app/routes/go_router.dart';
import 'package:suprapp/app/shared/widgets/custom_elevated_button.dart';
import 'package:suprapp/app/shared/widgets/custom_textformfield.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final search = TextEditingController();
  final List<Map<String, String>> items = [
    {
      'title': 'Mona',
      'subtitle': '62 - 67 - 4 - Business Bay - Dubai  ',
    },
    {
      'title': 'Mona',
      'subtitle': '62 - 67 - 4 - Business Bay - Dubai  ',
    },
  ];
  @override
  Widget build(BuildContext context) {
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
          "SEARCH ",
          style: textTheme(context).titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: colorScheme(context).onSurface),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                height: 40, // custom height(
                child: CustomTextFormField(
                  fillColor: colorScheme(context).onSurface.withOpacity(0.08),
                  hint: ' Search for a location',
                  hintSize: 16,
                  borderColor: Colors.transparent,
                  hintColor: AppColors.darkGrey,
                  prefixIcon: AppIcon.searchIcon,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '|',
                          style: textTheme(context).titleSmall?.copyWith(
                              color: colorScheme(context)
                                  .onSurface
                                  .withOpacity(0.2),
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "USA", // Replace with selected country variable
                          style: textTheme(context).titleSmall?.copyWith(
                              color: colorScheme(context)
                                  .onSurface
                                  .withOpacity(0.2),
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(width: 10),
                        Icon(
                          Icons.keyboard_arrow_down,
                          color:
                              colorScheme(context).onSurface.withOpacity(0.2),
                          size: 23,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  height: 40,
                  width: double.infinity,
                  color: colorScheme(context).onSurface.withOpacity(0.08),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Saved Location", // Replace with selected country variable
                      style: textTheme(context).bodyLarge?.copyWith(
                          color:
                              colorScheme(context).onSurface.withOpacity(0.2),
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                SizedBox(
                  height: 400,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final item = items[index];
                      return ListTile(
                        title: Text(
                          item['title']!,
                          style: textTheme(context).bodyLarge?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: colorScheme(context).onSurface),
                        ),
                        subtitle: Text(
                          item['subtitle']!,
                          style: textTheme(context).bodyLarge?.copyWith(
                              color: colorScheme(context)
                                  .onSurface
                                  .withOpacity(0.2),
                              fontWeight: FontWeight.w600),
                        ),
                        trailing: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.favorite,
                            size: 20,
                            color: colorScheme(context).primary,
                          ),
                        ),
                        onTap: () {
                          print('Tapped on ${item['title']}');
                        },
                      );
                    },
                  ),
                ),
                Container(
                  height: 40,
                  width: double.infinity,
                  color: colorScheme(context).onSurface.withOpacity(0.08),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Nearby Location", // Replace with selected country variable
                      style: textTheme(context).bodyLarge?.copyWith(
                          color:
                              colorScheme(context).onSurface.withOpacity(0.2),
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                SizedBox(
                  height: 400,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final item = items[index];
                      return ListTile(
                        title: Text(
                          item['title']!,
                          style: textTheme(context).bodyLarge?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: colorScheme(context).onSurface),
                        ),
                        subtitle: Text(
                          item['subtitle']!,
                          style: textTheme(context).bodyLarge?.copyWith(
                              color: colorScheme(context)
                                  .onSurface
                                  .withOpacity(0.2),
                              fontWeight: FontWeight.w600),
                        ),
                        trailing: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.favorite_outline,
                            size: 20,
                            color:
                                colorScheme(context).onSurface.withOpacity(0.2),
                          ),
                        ),
                        onTap: () {
                          print('Tapped on ${item['title']}');
                        },
                      );
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
