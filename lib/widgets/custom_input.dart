import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/theme_colors.dart';

class CustomInput extends StatelessWidget {
  final String label;
  final bool isPassword;
  final TextEditingController? controller;

  const CustomInput({
    super.key,
    required this.label,
    this.isPassword = false,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Nadpis poľa (napr. USERNAME)
        Text(
          label.toUpperCase(),
          style: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.2, // Roztiahnuté písmená
            color: AppColors.textBlack.withOpacity(0.7),
          ),
        ),
        const SizedBox(height: 8),
        
        // Samotné pole
        TextField(
          controller: controller,
          obscureText: isPassword, // Ak je heslo, skryje text
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.inputGrey,
            hintText: isPassword ? "******" : null, // Placeholder
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none, // Bez čierneho obrysu
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
          ),
        ),
        const SizedBox(height: 20), // Medzera pod poľom
      ],
    );
  }
}