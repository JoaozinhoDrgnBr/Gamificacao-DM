import 'package:atividade4/shared/constants/constants.dart';
import 'package:atividade4/shared/themes/theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDark = themeProvider.isDarkMode;

    return AppBar(
      title: Text(
        'Atividade 4',
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
          color: AppColors.textDark,
          fontWeight: FontWeight.w700,
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Light\nTheme',
              textAlign: TextAlign.right,
              style:
                  themeProvider.isDarkMode
                      ? const TextStyle(
                        fontSize: 12,
                        color: AppColors.textLight,
                      )
                      : const TextStyle(
                        fontSize: 12,
                        color: AppColors.textDark,
                      ),
            ),
            const SizedBox(width: 8),
            CupertinoSwitch(
              value: isDark,
              onChanged: (value) {
                themeProvider.toggleTheme(value);
              },
              activeTrackColor: AppColors.backgroundLight,
              inactiveTrackColor: AppColors.textLight,
              inactiveThumbColor: AppColors.backgroundLight,
              thumbColor: AppColors.textLight,
            ),
            const SizedBox(width: 8),
            Text(
              'Dark\nMode',
              textAlign: TextAlign.left,
              style:
                  themeProvider.isDarkMode
                      ? const TextStyle(fontSize: 12, color: AppColors.textDark)
                      : const TextStyle(
                        fontSize: 12,
                        color: AppColors.textLight,
                      ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
