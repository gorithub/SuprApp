import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:suprapp/app/core/constants/app_colors.dart';
import 'package:suprapp/app/core/constants/app_images.dart';
import 'package:suprapp/app/core/constants/global_variables.dart';
import 'package:suprapp/app/features/home/widgets/top_sheet.dart';
import 'package:suprapp/app/features/shops/models/all_shops_model.dart';
import 'package:suprapp/app/features/shops/models/shop_spec_model.dart';
import 'package:suprapp/app/features/shops/models/specific_shop_model.dart';
import 'package:suprapp/app/features/shops/pages/cart_page.dart';
import 'package:suprapp/app/features/shops/pages/cateogory_shops.dart';
import 'package:suprapp/app/features/shops/services/products_page.dart';
import 'package:suprapp/app/features/shops/services/shops_service.dart';
import 'package:suprapp/app/shared/widgets/custom_back_button.dart';

class ShopsScreen extends StatefulWidget {
  const ShopsScreen({super.key});

  @override
  State<ShopsScreen> createState() => _ShopsScreenState();
}

class _ShopsScreenState extends State<ShopsScreen> {
  late Future<List<AllShopsModel>> _shopsFuture;
  late Future<List<AllShopsModel>> _recommendedShopsFuture;
  late Future<List<SpecificShopModel>> _allshopsFuture;
  List<String> addressList = ["villa 13", "villa 14", "villa 15"];
  String selectedAddress = "villa 13";

  @override
  void initState() {
    super.initState();
    _shopsFuture = ShopService().getAllShops();
    _recommendedShopsFuture = ShopService().getRecommendedShops();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "assets/app_logo.png",
                  height: 30,
                  width: 70,
                ),
                Text(
                  textAlign: TextAlign.center,
                  "Shops",
                  style: textTheme(context).headlineLarge?.copyWith(
                      fontWeight: FontWeight.w600, color: AppColors.darkGreen),
                ),
                CircleAvatar(
                  radius: 20,
                  backgroundColor: AppColors.darkGreen,
                  child: IconButton(
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
                    icon: Icon(
                      Icons.menu,
                      size: 20,
                      color: colorScheme(context).surface,
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomBackButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.location_on_outlined, size: 18),
                    SizedBox(width: 4),
                    Text(
                      "Deliver to ",
                      style: textTheme(context)
                          .bodySmall
                          ?.copyWith(fontWeight: FontWeight.w400),
                    ),
                    DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: selectedAddress,
                        items: addressList.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: textTheme(context).bodySmall?.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            selectedAddress = newValue!;
                          });
                        },
                        icon:
                            Icon(Icons.keyboard_arrow_down_outlined, size: 20),
                        style: textTheme(context).bodySmall?.copyWith(
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => CartPage(),
                    ));
                  },
                  icon: Icon(Icons.shopping_cart_outlined),
                ),

                SizedBox(
                  height: 5,
                ),
                // Container(
                //   decoration: BoxDecoration(color: AppColors.darkGreen),
                //   padding: EdgeInsets.all(5.0),
                //   child: Icon(
                //     Icons.menu,
                //     color: colorScheme(context).onPrimary,
                //     size: 18,
                //   ),
                // )
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Search all shops and products",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(9.0),
                  ),
                  borderSide: BorderSide(
                    color: Color(0xffBDBABA),
                  ),
                ),
                hintStyle: textTheme(context).titleMedium?.copyWith(
                      color: Color(0xff9C9C9C),
                    ),
                suffixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SvgPicture.asset(
                    AppIcon.searchIcon,
                  ),
                ),
                suffixIconConstraints: BoxConstraints(
                  maxHeight: 16,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            FutureBuilder<List<AllShopsModel>>(
              future: _shopsFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting)
                  return Center(child: CircularProgressIndicator());
                if (snapshot.hasError)
                  return Center(child: Text("Error fetching shops"));
                if (!snapshot.hasData || snapshot.data!.isEmpty)
                  return Center(child: Text("No shops available"));

                final shopItems = snapshot.data!;

                return GridView.count(
                  crossAxisCount: 4,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 10,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  childAspectRatio: 0.9,
                  children: shopItems.map((item) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => CateogoryShops(
                              categoryId: item.shopId,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.stickerGrey,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(height: 5),
                            Flexible(
                              flex: 2,
                              child: SizedBox(
                                child: CachedNetworkImage(
                                  imageUrl: item.shopImage,
                                  fit: BoxFit.contain,
                                  placeholder: (context, url) => const Center(
                                      child: CircularProgressIndicator()),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              ),
                            ),
                            SizedBox(height: 5.0),
                            Flexible(
                              flex: 1,
                              child: Text(
                                overflow: TextOverflow.ellipsis,
                                item.shopname,
                                textAlign: TextAlign.center,
                                style: textTheme(context)
                                    .bodySmall
                                    ?.copyWith(fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                );
              },
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 200,
              child: Row(
                children: [
                  Expanded(
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(
                          30,
                        )),
                        child: Image.asset(
                          AppImages.storeWideSale,
                        )),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(
                          30,
                        )),
                        child: Image.asset(AppImages.grocerySale)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Recommended Shops",
                  style: textTheme(context).headlineSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
            ),
            FutureBuilder<List<AllShopsModel>>(
              future: _recommendedShopsFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting)
                  return Center(child: CircularProgressIndicator());

                if (snapshot.hasError)
                  return Center(child: Text("Error loading recommended shops"));

                if (!snapshot.hasData || snapshot.data!.isEmpty)
                  return Center(child: Text("No recommended shops"));

                final shops = snapshot.data!;
                return SizedBox(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: shops.length,
                    itemBuilder: (context, index) {
                      final shop = shops[index];
                      return Padding(
                        padding: EdgeInsets.only(right: 10.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => CateogoryShops(
                                  categoryId: shop.shopId,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              image: DecorationImage(
                                image: NetworkImage(shop.shopImage),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "All Shops",
                  style: textTheme(context).headlineSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
            ),
            FutureBuilder<List<ShopWithSpecifics>>(
                future: ShopService().getShopsWithSpecifics(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }

                  if (snapshot.hasError) {
                    return Text("Error loading data");
                  }

                  final shops = snapshot.data!;

                  return ListView.builder(
                    itemCount: shops.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final shop = shops[index].shop;
                      final specificShops = shops[index].specificShops;
                      if (specificShops.isEmpty) {
                        return ListTile(
                          title: Text(shop.shopname),
                          subtitle: Text("No specific shops available"),
                        );
                      }

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: ListTile(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ProductsPage(
                                  specId: specificShops[0].idSpecificShop,
                                  shopid: shop.shopId,
                                ),
                              ),
                            );
                          },
                          contentPadding: EdgeInsets.zero,
                          isThreeLine: true,
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: Image.network(
                              specificShops[0].shopImage,
                              height: 80.0,
                              width: 60.0,
                              fit: BoxFit.fill,
                            ),
                          ),
                          title: Text(
                            specificShops[0].shopName,
                            style: textTheme(context)
                                .titleLarge
                                ?.copyWith(fontWeight: FontWeight.w600),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.star,
                                      color: AppColors.darkGreen, size: 16),
                                  RichText(
                                    text: TextSpan(
                                      text: specificShops[0].rating,
                                      style: textTheme(context)
                                          .bodyLarge
                                          ?.copyWith(
                                              color: AppColors.darkGreen,
                                              fontWeight: FontWeight.w600),
                                      children: [
                                        TextSpan(
                                          text:
                                              " (${specificShops[0].rating}) ",
                                          style: textTheme(context)
                                              .bodyLarge
                                              ?.copyWith(
                                                  fontWeight: FontWeight.w600),
                                        ),
                                        TextSpan(
                                          text:
                                              ".${specificShops[0].arriveTime}",
                                          style: textTheme(context)
                                              .bodyLarge
                                              ?.copyWith(
                                                  color: AppColors.darkGreen,
                                                  fontWeight: FontWeight.w600),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SvgPicture.asset(AppIcon.happyIcon,
                                      width: 28, height: 18),
                                  SizedBox(width: 5),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: colorScheme(context).error,
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 2.0, horizontal: 4.0),
                                    child: RichText(
                                      text: TextSpan(
                                        text: '40% off',
                                        style: textTheme(context)
                                            .labelMedium
                                            ?.copyWith(
                                                color: colorScheme(context)
                                                    .onPrimary),
                                        children: [TextSpan(text: "% off")],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }),
          ])),
    )));
  }
}
