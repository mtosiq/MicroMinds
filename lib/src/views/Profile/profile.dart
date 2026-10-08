import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Authentication Screens/loginScreen.dart';
import '../../../theme/app_theme.dart';

class ProfilePage extends StatelessWidget with ThemeColors {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              /// HEADER
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Profile",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    height: 42,
                    width: 42,
                    decoration: BoxDecoration(
                      color: cardColor,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.settings_outlined,
                      color: Colors.white,
                      size: 21,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              /// PROFILE CARD
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  children: [
                    /// PROFILE IMAGE
                    Container(
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [
                            orange,
                            purple,
                          ],
                        ),
                      ),
                      padding: const EdgeInsets.all(3),
                      child: const CircleAvatar(
                        backgroundColor: AppColors.border,
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 45,
                        ),
                      ),
                    ),

                    const SizedBox(height: 14),

                    Text(
                      user?.displayName ?? user?.email ?? "Your profile",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 5),

                    Text(
                      user?.email ?? "Food lover • Home chef",
                      style: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 13,
                      ),
                    ),

                    const SizedBox(height: 18),

                    /// EDIT PROFILE BUTTON
                    SizedBox(
                      width: double.infinity,
                      height: 45,
                      child: ElevatedButton(
                        onPressed: () {
                          // Open edit profile page
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white.withOpacity(.08),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: const Text(
                          "Edit Profile",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              /// STATS
              Row(
                children: [
                  Expanded(
                    child: _buildStatCard(
                      icon: Icons.stars,
                      value: "420",
                      title: "Points",
                      color: purple,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildStatCard(
                      icon: Icons.bookmark,
                      value: "28",
                      title: "Saved",
                      color: orange,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildStatCard(
                      icon: Icons.restaurant,
                      value: "16",
                      title: "Cooked",
                      color: AppColors.green,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              /// YOUR KITCHEN
              const Text(
                "Your Kitchen",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              _buildMenuTile(
                icon: Icons.bookmark_outline,
                title: "Saved Recipes",
                subtitle: "28 recipes saved",
                color: purple,
                onTap: () {
                  // Open saved recipes
                },
              ),

              const SizedBox(height: 10),

              _buildMenuTile(
                icon: Icons.history,
                title: "Cooking History",
                subtitle: "See what you've cooked",
                color: orange,
                onTap: () {
                  // Open cooking history
                },
              ),

              const SizedBox(height: 10),

              _buildMenuTile(
                icon: Icons.inventory_2_outlined,
                title: "My Pantry",
                subtitle: "Manage your ingredients",
                color: AppColors.green,
                onTap: () {
                  // Open pantry
                },
              ),

              const SizedBox(height: 28),

              /// PREFERENCES
              const Text(
                "Preferences",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              _buildMenuTile(
                icon: Icons.favorite_outline,
                title: "Dietary Preferences",
                subtitle: "Vegetarian, allergies & more",
                color: AppColors.pink,
                onTap: () {
                  // Open dietary preferences
                },
              ),

              const SizedBox(height: 10),

              _buildMenuTile(
                icon: Icons.notifications_none,
                title: "Notifications",
                subtitle: "Manage your notifications",
                color: AppColors.yellow,
                onTap: () {
                  // Open notification settings
                },
              ),

              const SizedBox(height: 10),

              _buildMenuTile(
                icon: Icons.dark_mode_outlined,
                title: "Appearance",
                subtitle: "Dark mode",
                color: AppColors.indigo,
                trailing: Switch(
                  value: true,
                  onChanged: (value) {},
                  activeColor: purple,
                  activeTrackColor: purple.withOpacity(.3),
                ),
                onTap: () {},
              ),

              const SizedBox(height: 28),

              /// SUPPORT
              const Text(
                "Support",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              _buildMenuTile(
                icon: Icons.help_outline,
                title: "Help & Support",
                subtitle: "Get help with the app",
                color: AppColors.blue,
                onTap: () {
                  // Open help
                },
              ),

              const SizedBox(height: 10),

              _buildMenuTile(
                icon: Icons.info_outline,
                title: "About",
                subtitle: "Version 1.0.0",
                color: Colors.grey,
                onTap: () {
                  // Open about
                },
              ),

              const SizedBox(height: 25),

              /// LOGOUT BUTTON
              SizedBox(
                width: double.infinity,
                height: 52,
                child: OutlinedButton.icon(
                  onPressed: () {
                    _showLogoutDialog(context);
                  },
                  icon: const Icon(
                    Icons.logout,
                    color: Colors.redAccent,
                  ),
                  label: const Text(
                    "Log Out",
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: Colors.redAccent.withOpacity(.25),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  /// STAT CARD
  Widget _buildStatCard({
    required IconData icon,
    required String value,
    required String title,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 8,
      ),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: color,
            size: 21,
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            title,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }

  /// MENU TILE
  Widget _buildMenuTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
    Widget? trailing,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          children: [
            Container(
              height: 43,
              width: 43,
              decoration: BoxDecoration(
                color: color.withOpacity(.12),
                borderRadius: BorderRadius.circular(13),
              ),
              child: Icon(
                icon,
                color: color,
                size: 21,
              ),
            ),
            const SizedBox(width: 13),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
            trailing ??
                const Icon(
                  Icons.chevron_right,
                  color: Colors.grey,
                  size: 20,
                ),
          ],
        ),
      ),
    );
  }

  /// LOGOUT DIALOG
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: cardColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
          ),
          title: const Text(
            "Log Out?",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: const Text(
            "Are you sure you want to log out?",
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "Cancel",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _signOut(context);
              },
              child: const Text(
                "Log Out",
                style: TextStyle(
                  color: Colors.redAccent,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _signOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      if (!context.mounted) return;
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const LoginScreen()),
        (route) => false,
      );
    } on FirebaseAuthException catch (error) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.message ?? 'Unable to log out. Please try again.'),
        ),
      );
    }
  }
}
