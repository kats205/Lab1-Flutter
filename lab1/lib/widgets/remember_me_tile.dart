import 'package:flutter/material.dart';

import '../apps/app_text_styles.dart';
import '../apps/app_theme.dart';

class RememberMeTile extends StatelessWidget {
  const RememberMeTile({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final bool value;
  final VoidCallback onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onChanged,
      borderRadius: BorderRadius.circular(6),
      child: Row(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: value ? AppTheme.primary : const Color(0xffEBF3FF),
              borderRadius: BorderRadius.circular(6),
            ),
            child: value
                ? const Icon(Icons.check_rounded, color: Colors.white, size: 16)
                : null,
          ),
          const SizedBox(width: 8),
          Text(
            'Remember me',
            style: AppTextStyles.dmSans(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppTheme.textHint,
            ),
          ),
        ],
      ),
    );
  }
}
