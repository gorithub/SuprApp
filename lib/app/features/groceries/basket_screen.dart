import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:suprapp/app/core/constants/app_colors.dart';
import 'package:suprapp/app/core/constants/global_variables.dart';
import 'package:suprapp/app/features/dine_out/widgets/custom_card.dart';
import 'package:suprapp/app/features/groceries/controllers/product_quantity_provider.dart';
import 'package:suprapp/app/features/groceries/models/product_model.dart';
import 'package:suprapp/app/shared/widgets/custom_textformfield.dart';

class BasketScreen extends StatelessWidget {
  const BasketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorScheme(context).surface,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              context.pop();
            },
            child: Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12, width: 1),
                  borderRadius: BorderRadius.circular(8)),
              child: Icon(
                Icons.arrow_back,
                size: 16,
                color: colorScheme(context).onSurface,
              ),
            ),
          ),
        ),
        title: Text(
          'My Basket',
          style: textTheme(context).headlineLarge?.copyWith(
                color: colorScheme(context).onSurface,
                fontWeight: FontWeight.w600,
              ),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Container(
              height: 5,
              width: double.infinity,
              color: AppColors.backgroundGrey,
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Your Basket',
                        style: textTheme(context).displayMedium?.copyWith(
                            color: colorScheme(context).onSurface,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Consumer<QuantityProvider>(
                        builder: (context, itrm, child) => Text(
                          '${itrm.totalUniqueItems} items :',
                          style: const TextStyle(
                              color: AppColors.textGrey,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      context.pop();
                    },
                    child: Icon(Icons.add,
                        size: 30,
                        color: colorScheme(context).primary,
                        semanticLabel: 'Add more items'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 3.0),
                    child: GestureDetector(
                      onTap: () {
                        context.pop();
                      },
                      child: Text('Add more items',
                          style: textTheme(context).displayMedium?.copyWith(
                                color: colorScheme(context).primary,
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                              )),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Divider(
              color: AppColors.backgroundGrey,
            ),
            const SizedBox(height: 8),
            Consumer<QuantityProvider>(
              builder: (context, value, child) => ListView.builder(
                shrinkWrap: true,
                itemCount: value.basketedList.length,
                itemBuilder: (context, index) {
                  final item = value.basketedList[index];
                  final id = item.id;
                  final quantity = item.currentTotalItem;
                  return Card(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                    child: ListTile(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 12),
                      title: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Product Image
                          Container(
                            width: 120,
                            height: 80,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFAF6EF),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            clipBehavior: Clip.hardEdge,
                            child: CachedNetworkImage(
                              imageUrl: item.image,
                              fit: BoxFit.cover,
                              placeholder: (context, url) => Shimmer.fromColors(
                                baseColor: Colors.grey.shade300,
                                highlightColor: Colors.grey.shade100,
                                child: Container(color: Colors.grey.shade300),
                              ),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                          const SizedBox(width: 12),

                          // Title, Price & Quantity
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(item.title,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600)),
                                const SizedBox(height: 6),
                                Text('Price: AED ${item.price}'),
                                const SizedBox(height: 16),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: AnimatedSwitcher(
                                    duration: const Duration(milliseconds: 300),
                                    switchInCurve: Curves.linear,
                                    switchOutCurve: Curves.linear,
                                    transitionBuilder: (child, animation) {
                                      return SlideTransition(
                                        position: Tween<Offset>(
                                          begin: const Offset(1.0, 0.0),
                                          end: Offset.zero,
                                        ).animate(animation),
                                        child: FadeTransition(
                                            opacity: animation, child: child),
                                      );
                                    },
                                    child: quantity > 0
                                        ? Container(
                                            key: const ValueKey(
                                                'quantity_controls'),
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8, vertical: 6),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all(
                                                  color: Colors.black12),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black12
                                                      .withOpacity(0.05),
                                                  blurRadius: 4,
                                                  offset: const Offset(0, 2),
                                                ),
                                              ],
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    InkWell(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      onTap: () {
                                                        if (quantity == 1) {
                                                          value.deleteBasket(
                                                              index);
                                                          context
                                                              .read<
                                                                  QuantityProvider>()
                                                              .decrease(
                                                                  id,
                                                                  double.parse(
                                                                      item.price));
                                                          // context
                                                          //     .read<
                                                          //         QuantityProvider>()
                                                          //     .remove(id);
                                                        } else {
                                                          context
                                                              .read<
                                                                  QuantityProvider>()
                                                              .decrease(
                                                                  id,
                                                                  double.parse(
                                                                      item.price));
                                                        }
                                                      },
                                                      child: Icon(
                                                        quantity == 1
                                                            ? Icons.delete
                                                            : Icons.remove,
                                                        size: 20,
                                                        color: quantity == 1
                                                            ? AppColors.darkGrey
                                                            : Colors.black,
                                                      ),
                                                    ),
                                                    const SizedBox(width: 12),
                                                    Text(
                                                      quantity.toString(),
                                                      style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                    const SizedBox(width: 12),
                                                    InkWell(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      onTap: () {
                                                        context
                                                            .read<
                                                                QuantityProvider>()
                                                            .increase(
                                                              id,
                                                              double.parse(
                                                                  item.price),
                                                              item,
                                                            );
                                                      },
                                                      child: const Icon(
                                                          Icons.add,
                                                          size: 20),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 4),
                                                // Optional: Show total price
                                                // Text(
                                                //   '₹${totalPrice.toStringAsFixed(2)}',
                                                //   style: const TextStyle(
                                                //     fontSize: 14,
                                                //     color: Colors.green,
                                                //     fontWeight: FontWeight.w600,
                                                //   ),
                                                // ),
                                              ],
                                            ),
                                          )
                                        : InkWell(
                                            key: const ValueKey('add_button'),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            onTap: () {
                                              context
                                                  .read<QuantityProvider>()
                                                  .increase(
                                                    id,
                                                    double.parse(item.price),
                                                    item,
                                                  );
                                            },
                                            child: Container(
                                              height: 32,
                                              width: 32,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                border: Border.all(
                                                    color: Colors.black12),
                                              ),
                                              child: const Icon(Icons.add,
                                                  size: 20),
                                            ),
                                          ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Divider(
              thickness: 5,
              color: AppColors.backgroundGrey,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.network(
                    'https://static.vecteezy.com/system/resources/previews/033/335/092/large_2x/food-delivery-driver-on-a-motorbike-flat-style-illustration-food-delivery-rider-on-a-bike-with-a-food-box-stock-image-vector.jpg',
                    height: 35,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'You seem to be a new location .',
                        style: textTheme(context).bodySmall?.copyWith(
                            color: colorScheme(context).onSurface,
                            fontWeight: FontWeight.w600,
                            fontSize: 17),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: Text(
                          'Arabin war Museum Dubai | Al Safa Street, AL Wasi , Dubai , United Arab Emirates',
                          style: textTheme(context).bodySmall?.copyWith(
                              color: AppColors.textGrey,
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Divider(
              color: AppColors.backgroundGrey,
              thickness: 2,
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text('Did You Forget ?',
                  style: textTheme(context).displayMedium?.copyWith(
                        color: colorScheme(context).onSurface,
                        fontWeight: FontWeight.w600,
                      )),
            ),
            SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(forgotList.length, (index) {
                  final item = forgotList[index];
                  final id = item.id;
                  final quantity =
                      context.watch<QuantityProvider>().getQuantity(id);
                  final totalPrice =
                      context.watch<QuantityProvider>().getTotalPrice(id);

                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12, width: 1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      width: 110,
                      child: Column(
                        children: [
                          Container(
                            height: 70,
                            width: 110,
                            color: Color(0xfff8f5ee),
                            child: ClipRRect(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(12)),
                              child: Image.network(
                                item.image,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text('AED : 2.00',
                              style: textTheme(context).bodySmall?.copyWith(
                                    color: colorScheme(context).onSurface,
                                    fontWeight: FontWeight.w600,
                                  )),
                          SizedBox(
                            height: 10,
                          ),
                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            switchInCurve: Curves.linear,
                            switchOutCurve: Curves.linear,
                            transitionBuilder: (child, animation) {
                              return SlideTransition(
                                position: Tween<Offset>(
                                  begin: const Offset(1.0, 0.0),
                                  end: Offset.zero,
                                ).animate(animation),
                                child: FadeTransition(
                                    opacity: animation, child: child),
                              );
                            },
                            child: quantity > 0
                                ? Container(
                                    key: const ValueKey('quantity_controls'),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 6),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(color: Colors.black12),
                                      boxShadow: [
                                        BoxShadow(
                                          color:
                                              Colors.black12.withOpacity(0.05),
                                          blurRadius: 4,
                                          offset: const Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            InkWell(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              onTap: () {
                                                if (quantity == 1) {
                                                  context
                                                      .read<QuantityProvider>()
                                                      .remove(id);
                                                } else {
                                                  context
                                                      .read<QuantityProvider>()
                                                      .decrease(
                                                          id,
                                                          double.parse(
                                                              item.price));
                                                }
                                              },
                                              child: Icon(
                                                quantity == 1
                                                    ? Icons.delete
                                                    : Icons.remove,
                                                size: 20,
                                                color: quantity == 1
                                                    ? Colors.red
                                                    : Colors.black,
                                              ),
                                            ),
                                            const SizedBox(width: 12),
                                            Text(
                                              quantity.toString(),
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                            ),
                                            const SizedBox(width: 12),
                                            InkWell(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              onTap: () {
                                                context
                                                    .read<QuantityProvider>()
                                                    .increase(
                                                      id,
                                                      double.parse(item.price),
                                                      item,
                                                    );
                                              },
                                              child: const Icon(Icons.add,
                                                  size: 20),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 4),
                                        // Optional: Show total price
                                        // Text(
                                        //   '₹${totalPrice.toStringAsFixed(2)}',
                                        //   style: const TextStyle(
                                        //     fontSize: 14,
                                        //     color: Colors.green,
                                        //     fontWeight: FontWeight.w600,
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                  )
                                : InkWell(
                                    key: const ValueKey('add_button'),
                                    borderRadius: BorderRadius.circular(8),
                                    onTap: () {
                                      context.read<QuantityProvider>().increase(
                                            id,
                                            double.parse(item.price),
                                            item,
                                          );
                                    },
                                    child: Container(
                                      height: 32,
                                      width: 32,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                        border:
                                            Border.all(color: Colors.black12),
                                      ),
                                      child: const Icon(Icons.add, size: 20),
                                    ),
                                  ),
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Divider(
              color: AppColors.backgroundGrey,
              thickness: 6,
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text('Tap to Save',
                  style: textTheme(context).displayMedium?.copyWith(
                        color: colorScheme(context).onSurface,
                        fontWeight: FontWeight.w600,
                      )),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: CustomTextFormField(
                borderRadius: 8,
                fillColor: colorScheme(context).surface,
                hint: 'Have a code? Tap it here...',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              color: AppColors.backgroundGrey,
              thickness: 3,
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 3.0, right: 10),
                    child: Text('Reward Your Captains',
                        style: textTheme(context).displayMedium?.copyWith(
                              color: colorScheme(context).onSurface,
                              fontWeight: FontWeight.w600,
                            )),
                  ),
                  Icon(
                    Icons.info_outline,
                    size: 25,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                    4,
                    (index) => Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: AppColors.backgroundGrey,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(index.toString(),
                                    style: textTheme(context)
                                        .displaySmall
                                        ?.copyWith(
                                          color: colorScheme(context).onSurface,
                                          fontWeight: FontWeight.w600,
                                        )),
                                SizedBox(
                                  height: 5,
                                ),
                                Text('AED',
                                    style: textTheme(context)
                                        .bodyLarge
                                        ?.copyWith(
                                          color: colorScheme(context).onSurface,
                                          fontWeight: FontWeight.w600,
                                        ))
                              ],
                            ),
                          ),
                        )),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text('Payment Summary ',
                  style: textTheme(context).displayMedium?.copyWith(
                        color: colorScheme(context).onSurface,
                        fontWeight: FontWeight.w600,
                      )),
            ),
            SizedBox(
              height: 8,
            ),
            Divider(
              color: AppColors.backgroundGrey,
            ),
            Consumer<QuantityProvider>(
              builder: (context, price, child) => paymentTextWidget(
                  title: 'Basket total (incl. tax)',
                  price: price.totalAmount.toStringAsFixed(2),
                  context: context),
            ),
            SizedBox(
              height: 10,
            ),
            paymentTextWidget(
                title: 'Discount',
                isInfo: true,
                price: 2.00.toStringAsFixed(2),
                context: context),
            SizedBox(
              height: 10,
            ),
            paymentTextWidget(
                title: 'Service fee',
                price: 3.50.toStringAsFixed(2),
                context: context),
            SizedBox(
              height: 10,
            ),
            paymentTextWidget(
                title: 'Delivery fee',
                price: 4.50.toStringAsFixed(2),
                context: context),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Order Total (incl. tax)',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
                  ),
                  Consumer<QuantityProvider>(
                    builder: (context, price, child) {
                      var allAmount = price.totalAmount + 2.00 + 3.50 + 4.50;

                      return Text(
                        'AED ${allAmount.toStringAsFixed(2)}',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text('Delivery Instructions',
                  style: textTheme(context).displayMedium?.copyWith(
                        color: colorScheme(context).onSurface,
                        fontWeight: FontWeight.w600,
                      )),
            ),
            SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(3, (index) {
                  List<String> lst = [
                    'Avoid Calling',
                    'Avoid ringing\nthe doorbell',
                    'Leave at the\ndoor'
                  ];
                  List<Icon> iconList = [
                    Icon(Icons.no_cell),
                    Icon(Icons.notifications_off_outlined),
                    Icon(Icons.door_front_door_outlined),
                  ];
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      height: 100,
                      decoration: BoxDecoration(
                        color: AppColors.backgroundGrey,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          iconList[index],
                          SizedBox(
                            height: 5,
                          ),
                          Text(lst[index],
                              textAlign: TextAlign.center,
                              style: textTheme(context).bodyLarge?.copyWith(
                                    color: colorScheme(context).onSurface,
                                    fontWeight: FontWeight.w600,
                                  ))
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Icon(Icons.pedal_bike_rounded),
                  SizedBox(
                    width: 14,
                  ),
                  Text(
                    'Add a note to captains',
                    style: textTheme(context)
                        .bodyMedium
                        ?.copyWith(color: AppColors.textGrey, fontSize: 17),
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.textGrey,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: GestureDetector(
                onTap: () {
                  _showPaymentBottomSheet(context);
                },
                child: Row(
                  children: [
                    Icon(Icons.payment),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Pay buy ...',
                      style: textTheme(context).bodyMedium?.copyWith(
                          color: colorScheme(context).onSurface,
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.keyboard_arrow_down_sharp)
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }

  void _showPaymentBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                "Select payment method",
                style: textTheme(context)
                    .displaySmall
                    ?.copyWith(fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 20),

              // Careem Credit Row
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Icon(Icons.credit_card, color: Colors.grey),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Careem credit",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text("Balance: PKR 0",
                              style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ),
                    Switch(value: false, onChanged: (val) {}),
                  ],
                ),
              ),
              Divider(),

              ListTile(
                leading: Icon(Icons.money, color: Colors.grey),
                title: Text("Cash"),
                trailing: Icon(Icons.radio_button_checked, color: Colors.green),
                onTap: () {}, // action on tap
              ),
              Divider(),

              ListTile(
                title: Text(
                  "Cards",
                  style: textTheme(context)
                      .labelSmall
                      ?.copyWith(fontWeight: FontWeight.w600, fontSize: 18),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Add",
                      style: textTheme(context)
                          .labelSmall
                          ?.copyWith(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                    Icon(
                      Icons.add,
                      color: Colors.black,
                      size: 25,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              // Info Row
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Icon(Icons.credit_card, color: Colors.black),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        "Enjoy instant access to services and seamless balance top-ups!",
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Confirm Button
              ElevatedButton(
                onPressed: () {
                  context.pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorScheme(context).primary,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: Text("Confirm",
                    style: textTheme(context).displaySmall?.copyWith(
                        color: colorScheme(context).surface,
                        fontSize: 17,
                        fontWeight: FontWeight.w600)),
              ),

              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  Widget paymentTextWidget(
      {required String title,
      required String price,
      required BuildContext context,
      bool? isInfo}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Text(title,
              style: textTheme(context).bodyLarge?.copyWith(
                    color: colorScheme(context).onSurface,
                    fontWeight: FontWeight.w600,
                  )),
          SizedBox(
            width: 10,
          ),
          isInfo == true
              ? SizedBox()
              : Icon(Icons.info_outline, size: 20, color: AppColors.textGrey),
          Spacer(),
          Text(
            'AED ${price}',
            style: textTheme(context).bodyLarge?.copyWith(
                  color: colorScheme(context).onSurface,
                  fontWeight: FontWeight.w600,
                ),
          )
        ],
      ),
    );
  }
}
