import 'package:flutter/material.dart';
import 'package:quent/generated/l10n.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: const EdgeInsets.symmetric(vertical: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Text(
          S.of(context).get_started,
          style: TextTheme.of(
            context,
          ).titleLarge?.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
