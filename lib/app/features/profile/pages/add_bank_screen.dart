import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddBankAccountScreen extends StatefulWidget {
  const AddBankAccountScreen({Key? key}) : super(key: key);

  @override
  State<AddBankAccountScreen> createState() => _AddBankAccountScreenState();
}

class _AddBankAccountScreenState extends State<AddBankAccountScreen> {
  final TextEditingController _accountNumberController =
      TextEditingController();
  String? _selectedBank;

  final List<String> _banks = [
    'Bank Central Asia',
    'Bank Mandiri',
    'Bank Negara Indonesia',
    'Bank Rakyat Indonesia',
    'CIMB Niaga',
    'Bank Danamon',
    'Bank Permata',
  ];

  @override
  void dispose() {
    _accountNumberController.dispose();
    super.dispose();
  }

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
          'Add New Bank Account',
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Bank name field
            const Text(
              'Bank Name',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: DropdownButtonFormField<String>(
                value: _selectedBank,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                  border: InputBorder.none,
                  hintText: 'Choose bank',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
                icon: Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.grey.shade400,
                ),
                onChanged: (value) {
                  setState(() {
                    _selectedBank = value;
                  });
                },
                items:
                    _banks.map((bank) {
                      return DropdownMenuItem<String>(
                        value: bank,
                        child: Text(bank),
                      );
                    }).toList(),
              ),
            ),
            const SizedBox(height: 24),

            // Account number field
            const Text(
              'Account Number',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                controller: _accountNumberController,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                  border: InputBorder.none,
                  hintText: 'Enter account number',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
            ),

            // Spacer to push button to bottom
            const Spacer(),

            // Confirm button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Handle confirm action
                  if (_selectedBank != null &&
                      _accountNumberController.text.isNotEmpty) {
                    // Perform validation and submission
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Bank account added successfully'),
                      ),
                    );
                    Navigator.pop(context);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please fill all fields')),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff007438),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'CONFIRM',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
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
