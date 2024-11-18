import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Account",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
            ),
            _buildListTile(
              icon: Icons.person,
              title: "Profile",
              subtitle: "Edit your profile information",
              onTap: () {
                // Navigate to Profile Screen
              },
            ),
            _buildListTile(
              icon: Icons.lock,
              title: "Change Password",
              subtitle: "Update your password",
              onTap: () {
                // Navigate to Change Password Screen
              },
            ),
            _buildDivider(),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Preferences",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
            ),
            _buildListTile(
              icon: Icons.dark_mode,
              title: "Dark Mode",
              trailing: Switch(
                value:
                    true, // Default value (can be linked with a state variable)
                onChanged: (value) {
                  // Handle theme change
                },
              ),
              onTap: () {},
            ),
            _buildListTile(
              icon: Icons.language,
              title: "Language",
              subtitle: "Select your preferred language",
              onTap: () {
                // Navigate to Language Selection Screen
              },
            ),
            _buildDivider(),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Notifications",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
            ),
            _buildListTile(
              icon: Icons.notifications,
              title: "Push Notifications",
              trailing: Switch(
                value: true,
                onChanged: (value) {
                  // Handle notification toggle
                },
              ),
              onTap: () {},
            ),
            _buildDivider(),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Other",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
            ),
            _buildListTile(
              icon: Icons.info,
              title: "About",
              subtitle: "Learn more about the app",
              onTap: () {
                // Navigate to About Screen
              },
            ),
            _buildListTile(
              icon: Icons.logout,
              title: "Logout",
              onTap: () {
                // Perform Logout
              },
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to create a ListTile
  Widget _buildListTile({
    required IconData icon,
    required String title,
    String? subtitle,
    Widget? trailing,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.deepPurple),
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle) : null,
      trailing: trailing,
      onTap: onTap,
    );
  }

  // Divider helper
  Widget _buildDivider() {
    return const Divider(
      thickness: 1,
      height: 10,
      color: Colors.grey,
    );
  }
}
