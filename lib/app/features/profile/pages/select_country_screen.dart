import 'package:flutter/material.dart';

class SelectCountryScreen extends StatefulWidget {
  const SelectCountryScreen({Key? key}) : super(key: key);

  @override
  State<SelectCountryScreen> createState() => _SelectCountryScreenState();
}

class _SelectCountryScreenState extends State<SelectCountryScreen> {
  String selectedCountry = 'United States Of America';

  // List of countries with their flags and names
  final List<Map<String, dynamic>> countries = [
    {'name': 'United States Of America', 'flag': 'assets/English.png'},
    {'name': 'United Kingdom of Saudia', 'flag': 'assets/Arabic.png'},
    {'name': 'French', 'flag': 'assets/French.png'},
    {'name': 'Turkey', 'flag': 'assets/Turkish.png'},
    {'name': 'Dutch', 'flag': 'assets/Dutch.png'},
  ];

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
          'Select Country',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          children: [
            ...countries.map((country) {
              final isSelected = country['name'] == selectedCountry;
              return Column(
                children: [
                  _buildCountryOption(
                    country['name'],
                    country['flag'],
                    isSelected,
                    onTap: () {
                      setState(() {
                        selectedCountry = country['name'];
                      });
                    },
                  ),
                  const SizedBox(height: 8),
                ],
              );
            }).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildCountryOption(
    String countryName,
    String flagAsset,
    bool isSelected, {
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey.shade200, width: 1),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.asset(
                  flagAsset,
                  width: 28,
                  height: 20,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16),
              Text(
                countryName,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
                  color: Colors.black87,
                ),
              ),
              const Spacer(),
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color:
                      isSelected
                          ? const Color(0xff007438)
                          : Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(4),
                ),
                child:
                    isSelected
                        ? const Icon(Icons.check, size: 14, color: Colors.white)
                        : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
