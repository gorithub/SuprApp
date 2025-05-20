import 'package:flutter/material.dart';
import 'package:suprapp/app/core/constants/app_colors.dart';
import 'package:suprapp/app/core/constants/global_variables.dart';

class OrderConfirmationPage extends StatefulWidget {
  const OrderConfirmationPage({super.key});

  @override
  State<OrderConfirmationPage> createState() => _OrderConfirmationPageState();
}

class _OrderConfirmationPageState extends State<OrderConfirmationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        automaticallyImplyLeading: false,
        title: Text(
          "Order confirmation",
          style: textTheme(context).titleMedium?.copyWith(
              color: colorScheme(context).onSurface,
              fontWeight: FontWeight.w700),
        ),
        leading: Icon(Icons.arrow_back, color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.green[50],
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    Icon(Icons.flash_on, color: colorScheme(context).primary),
                    SizedBox(width: 8),
                    Text(
                      "Delivery in 10 minutes",
                      style: textTheme(context).bodyLarge?.copyWith(
                          color: colorScheme(context).primary,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),

              // Order Items
              Card(
                margin: EdgeInsets.all(16),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Order Item(s)",
                        style: textTheme(context).titleMedium?.copyWith(
                            color: colorScheme(context).onSurface,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: 16),

                      // Dal Makhani Rice Bowl
                      Row(
                        children: [
                          Icon(Icons.radio_button_checked, color: Colors.green),
                          SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Dal Makhani Rice Bowl",
                                  style: textTheme(context).bodyLarge?.copyWith(
                                      color: colorScheme(context)
                                          .onSurface
                                          .withOpacity(0.4),
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  "Thums Up Can, Coca Co...",
                                  style: textTheme(context).bodySmall?.copyWith(
                                      color: colorScheme(context)
                                          .onSurface
                                          .withOpacity(0.3),
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Icon(Icons.remove, color: Colors.green),
                              SizedBox(width: 8),
                              Text("1"),
                              SizedBox(width: 8),
                              Icon(Icons.add, color: Colors.green),
                            ],
                          ),
                          SizedBox(width: 8),
                          Text("₹315",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Icon(Icons.radio_button_checked, color: Colors.green),
                          SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Pani Puri",
                                  style: textTheme(context).bodyLarge?.copyWith(
                                      color: colorScheme(context)
                                          .onSurface
                                          .withOpacity(0.4),
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  "Thums Up Can, Coca Co...",
                                  style: textTheme(context).bodySmall?.copyWith(
                                      color: colorScheme(context)
                                          .onSurface
                                          .withOpacity(0.3),
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Icon(Icons.remove, color: Colors.green),
                              SizedBox(width: 8),
                              Text("1"),
                              SizedBox(width: 8),
                              Icon(Icons.add, color: Colors.green),
                            ],
                          ),
                          SizedBox(width: 8),
                          Text("₹203",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.auto_awesome, color: Colors.green),
                          SizedBox(width: 8),
                          Expanded(
                              child: Text(
                            "Peri Peri Wedges",
                            style: textTheme(context).bodyLarge?.copyWith(
                                color: colorScheme(context).onSurface,
                                fontWeight: FontWeight.w700),
                          )),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                "Remove",
                                style: textTheme(context).bodySmall?.copyWith(
                                    color: colorScheme(context).primary,
                                    fontWeight: FontWeight.w700),
                              )),
                          Text(
                            "Free",
                            style: textTheme(context).bodySmall?.copyWith(
                                color: colorScheme(context).primary,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // Offers & Coupons
              Card(
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Offers & Coupons",
                        style: textTheme(context).titleLarge?.copyWith(
                            color: colorScheme(context).onSurface,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: 12),
                      Row(
                        children: [
                          Icon(Icons.discount, color: Colors.green),
                          SizedBox(width: 8),
                          Expanded(
                              child: Text(
                            "TRYSWISHNEW\nSave upto ₹80 on this order",
                            style: textTheme(context).bodyMedium?.copyWith(
                                color: colorScheme(context)
                                    .onSurface
                                    .withOpacity(0.5),
                                fontWeight: FontWeight.w700),
                          )),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                "Remove",
                                style: textTheme(context).bodySmall?.copyWith(
                                    color: colorScheme(context).primary,
                                    fontWeight: FontWeight.w700),
                              )),
                        ],
                      ),
                      SizedBox(height: 8),
                      GestureDetector(
                        onTap: () {},
                        child: Text("View more coupons >",
                            style: TextStyle(color: Colors.green)),
                      )
                    ],
                  ),
                ),
              ),

              // Billing Details
              Card(
                margin: EdgeInsets.all(16),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Billing Details",
                        style: textTheme(context).titleLarge?.copyWith(
                            color: colorScheme(context).onSurface,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Subtotal",
                            style: textTheme(context).titleMedium?.copyWith(
                                color: colorScheme(context)
                                    .onSurface
                                    .withOpacity(0.2),
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "₹608  ₹518",
                            style: textTheme(context).bodyLarge?.copyWith(
                                color: colorScheme(context).onSurface,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Delivery",
                            style: textTheme(context).titleMedium?.copyWith(
                                color: colorScheme(context)
                                    .onSurface
                                    .withOpacity(0.2),
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "Free",
                            style: textTheme(context).bodyMedium?.copyWith(
                                color: colorScheme(context).primary,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Discount (TRYSWISHNEW)",
                            style: textTheme(context).titleMedium?.copyWith(
                                color: colorScheme(context)
                                    .onSurface
                                    .withOpacity(0.2),
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "₹80",
                            style: textTheme(context).bodyMedium?.copyWith(
                                color: colorScheme(context).primary,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // Bottom Bar
              Container(
                color: Colors.grey[100],
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.timer,
                            color: const Color.fromARGB(255, 199, 158, 36)),
                        SizedBox(width: 8),
                        Text(
                          "Service Unavailable",
                          style: textTheme(context).bodyMedium?.copyWith(
                              color: colorScheme(context).secondary,
                              fontWeight: FontWeight.w700),
                        ),
                        Spacer(),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "Change",
                              style: textTheme(context).bodyMedium?.copyWith(
                                  color: colorScheme(context).onSurface,
                                  fontWeight: FontWeight.w700),
                            )),
                      ],
                    ),
                    SizedBox(height: 8),
                    SizedBox(
                      height: 60,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.darkGrey,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        child: Text(
                          "Pay ₹460",
                          style: textTheme(context).bodyMedium?.copyWith(
                              color: colorScheme(context).surface,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
