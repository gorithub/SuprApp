import 'package:flutter/material.dart';

class BankAccountScreen extends StatelessWidget {
  const BankAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(12),
          ),
          child: IconButton(
            icon: const Icon(Icons.chevron_left, color: Color(0xff007438)),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        title: const Text(
          'Bank Account',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Bank account card
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey.shade200, width: 1),
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'PT. Bank Central Asia TBK',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Arief Wahdan Alfhat',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '893462013',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xFFFFB74D),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TextButton(
                          onPressed: () {
                            // Handle delete action
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Confirm Deletion'),
                                content: const Text(
                                  'Are you sure you want to delete this bank account?',
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text(
                                      'Delete',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 8,
                            ),
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: const Text(
                            'Delete',
                            style: TextStyle(
                              color: Color(0xFFFFB74D),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Spacer to push the button to the bottom
            const Spacer(),

            // Add new bank account button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () {
                  // Handle add new bank account action
                },
                icon: const Icon(Icons.add, color: Colors.white),
                label: const Text(
                  'Add New Bank Account',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff007438),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 0,
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

// Example usage in main.dart
