import 'package:flutter/material.dart';

class SettingModel {
  final IconData icon1;
  final String t;
  final IconData icon2;

  final void Function(BuildContext) onTap;

  SettingModel(
      {required this.icon1,
      required this.t,
      required this.onTap,
      required this.icon2});
}

List<SettingModel> listProfile = [
  SettingModel(
    t: "Edit Profile",
    icon1: Icons.person_outline,
    onTap: (conttext) {},
    icon2: Icons.arrow_forward_ios,
  ),
  SettingModel(
    t: "Change Password",
    icon1: Icons.lock_outline,
    onTap: (conttext) {},
    icon2: Icons.arrow_forward_ios,
  ),
  SettingModel(
    t: "Notifications",
    icon1: Icons.notifications_none_outlined,
    onTap: (conttext) {},
    icon2: Icons.arrow_forward_ios,
  ),
  SettingModel(
    t: "Security",
    icon1: Icons.security,
    onTap: (conttext) {},
    icon2: Icons.arrow_forward_ios,
  ),
  SettingModel(
    t: "Language",
    icon1: Icons.language,
    onTap: (conttext) {},
    icon2: Icons.arrow_forward_ios,
  ),
];
