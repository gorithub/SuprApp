import 'package:flutter/material.dart';
import 'package:suprapp/app/core/constants/global_variables.dart';
import 'package:suprapp/app/features/profile/widgets/custom_arrow_back.dart';

class SelectCountryScreen extends StatefulWidget {
  const SelectCountryScreen({super.key});

  @override
  State<SelectCountryScreen> createState() => _SelectCountryScreenState();
}

class _SelectCountryScreenState extends State<SelectCountryScreen> {
  String selectedCountry = 'United States Of America';
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
      appBar: AppBar(
        leading: const CustomArrowBack(),
        title: Text('Select Country',
            style: textTheme(context)
                .headlineMedium
                ?.copyWith(fontWeight: FontWeight.bold)),
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
                  color: isSelected
                      ? const Color(0xff007438)
                      : Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: isSelected
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
