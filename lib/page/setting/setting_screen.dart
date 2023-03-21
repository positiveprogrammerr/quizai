import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizai/style/app_colors.dart';
import 'package:quizai/widget/app_scaffold.dart';
import 'package:quizai/widget/app_text_style.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: AppColors.darkPrimary,
      appBarBackground: AppColors.darkPrimary,
      appBarTitle: "Setting",
      body: Column(
        children: [
          const SizedBox(height: 24),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              color: AppColors.mainBlue.withOpacity(.26),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                _buildSettingListingItemWithSwitch(Icons.volume_up, "Sound"),
                const Divider(color: Colors.white12),
                _buildSettingListingItemWithDropdownButton(
                    CupertinoIcons.globe, "Language", "English"),
                const Divider(color: Colors.white12),
                _buildSettingListingItemWithDropdownButton(
                    Icons.school, "Categories", "Select"),
                const Divider(color: Colors.white12),
                _buildSettingListingItemWithSwitch(
                    Icons.rocket_launch, "Animation"),
                const Divider(color: Colors.white12),
                _buildSettingListingItemWithSwitch(
                    Icons.bolt, "Random Oppenents"),
                const Divider(color: Colors.white12),
                _buildSettingListingItemWithSwitch(
                    Icons.notifications, "Notifications"),
              ],
            ),
          ),
          Container(
            height: 20,
            margin: const EdgeInsets.symmetric(horizontal: 36),
            decoration: BoxDecoration(
              color: AppColors.mainBlue.withOpacity(.18),
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
            ),
          ),
          Container(
            height: 20,
            margin: const EdgeInsets.symmetric(horizontal: 56),
            decoration: BoxDecoration(
              color: AppColors.mainBlue.withOpacity(.09),
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
            ),
          ),
          const SafeArea(
            top: false,
            child: SizedBox.shrink(),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingListingItemWithSwitch(IconData icon, String label) {
    return ListTile(
      minLeadingWidth: 0,
      leading: Icon(icon, size: 26),
      title: Text(
        label,
        style: AppTextStyle.whiteTitle,
      ),
      trailing: CupertinoSwitch(
        value: true,
        onChanged: (v) {},
        activeColor: AppColors.cyan,
      ),
    );
  }

  Widget _buildSettingListingItemWithDropdownButton(
      IconData icon, String label, String dropdownTitle) {
    return ListTile(
      minLeadingWidth: 0,
      leading: Icon(icon, size: 26),
      title: Text(
        label,
        style: AppTextStyle.whiteTitle,
      ),
      trailing: DropdownButton(
        underline: Container(),
        iconEnabledColor: Colors.white,
        onChanged: (v) {},
        elevation: 0,
        borderRadius: BorderRadius.circular(12),
        dropdownColor: AppColors.darkPrimary,
        items: [
          DropdownMenuItem(
            child: Text(
              dropdownTitle,
              style: AppTextStyle.defaultWhite,
            ),
          )
        ],
      ),
    );
  }
}
