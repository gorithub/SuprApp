import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:suprapp/app/core/constants/app_colors.dart';
import 'package:suprapp/app/core/constants/global_variables.dart';
import 'package:suprapp/app/features/dine_out/controller/dine_out_provider.dart';
import 'package:suprapp/app/routes/go_router.dart';

class DineOutPage extends StatefulWidget {
  const DineOutPage({super.key});

  @override
  State<DineOutPage> createState() => _DineOutPageState();
}

class _DineOutPageState extends State<DineOutPage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final provider = Provider.of<DineOutProvider>(context);
    return Scaffold(
        appBar: AppBar(
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
          centerTitle: true,
          title: Text(
            'DineOut',
            style: textTheme(context).headlineLarge?.copyWith(
                  color: colorScheme(context).primary,
                  fontWeight: FontWeight.w600,
                ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {},
                child: Container(
                  height: 50,
                  width: 40,
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.appGrey),
                      borderRadius: BorderRadius.circular(7)),
                  child: Icon(
                    Icons.favorite_outline,
                    color: AppColors.darkGrey,
                    size: 16,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {},
                child: Container(
                  height: 50,
                  width: 40,
                  decoration: BoxDecoration(
                      color: colorScheme(context).primary,
                      border: Border.all(color: AppColors.appGrey),
                      borderRadius: BorderRadius.circular(7)),
                  child: Icon(
                    Icons.menu,
                    color: const Color.fromARGB(255, 20, 188, 96),
                    size: 15,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  "Where to DineOut?",
                  style: textTheme(context)
                      .bodyLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "Handpicked spots you'll want to try",
                  style: textTheme(context).bodyMedium?.copyWith(
                      color: colorScheme(context).onSurface.withOpacity(0.4)),
                ),
                trailing: Icon(
                  Icons.east,
                  color: Colors.black.withOpacity(0.6),
                  size: 20,
                ),
              ),
              SizedBox(
                height: height * 0.23,
                width: width,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: provider.items.length,
                    itemBuilder: (context, index) {
                      final item = provider.items[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () => context.pushNamed(
                            AppRoute.detailDineOutPage,
                            pathParameters: {
                              'parentIndex': index.toString(),
                            },
                          ),
                          child: Container(
                            height: height * 0.2,
                            width: width * 0.3,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(item.imageUrl),
                                    fit: BoxFit.fill),
                                borderRadius: BorderRadius.circular(8)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  item.title,
                                  style: textTheme(context)
                                      .bodyMedium
                                      ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color:
                                              colorScheme(context).onPrimary),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ));
  }
}
