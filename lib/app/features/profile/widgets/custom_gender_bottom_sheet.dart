import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:suprapp/app/core/constants/global_variables.dart';
import 'package:suprapp/app/features/profile/controller/gender_controller.dart';
import 'package:suprapp/app/shared/widgets/custom_elevated_button.dart';

class GenderBottomSheet extends StatelessWidget {
  const GenderBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GenderProvider>(context);
    String tempSelectedGender = provider.selectedGender; // Temporary value

    return StatefulBuilder(
      builder: (context, setState) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Your Gender",
                style: textTheme(context)
                    .headlineMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              _customTile(
                context,
                title: 'Male',
                value: 'Male',
                groupValue: tempSelectedGender,
                onChanged: (value) {
                  setState(() => tempSelectedGender = value!);
                },
              ),
              _customTile(
                context,
                title: 'Female',
                value: 'Female',
                groupValue: tempSelectedGender,
                onChanged: (value) {
                  setState(() => tempSelectedGender = value!);
                },
              ),
              _customTile(
                context,
                title: 'Prefer not to specify',
                value: 'Prefer not to specify',
                groupValue: tempSelectedGender,
                onChanged: (value) {
                  setState(() => tempSelectedGender = value!);
                },
              ),
              const SizedBox(height: 10),
              CustomElevatedButton(
                text: "Update",
                onPressed: () {
                  provider.setGender(tempSelectedGender);
                  context.pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _customTile(
    BuildContext context, {
    required String title,
    required String value,
    required String groupValue,
    required ValueChanged<String?> onChanged,
  }) {
    return RadioListTile<String>(
      title: Text(
        title,
        style: textTheme(context)
            .bodyMedium
            ?.copyWith(fontWeight: FontWeight.bold),
      ),
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
    );
  }
}
