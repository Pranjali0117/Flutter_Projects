import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home: ProfileScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 10,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ProfileHeader(),
                ProfileContent(),
                ContactSection(),
                SizedBox(height: 20), // Add some bottom padding
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey[600],
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_outline),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: '',
          ),
        ],
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Profile',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          Icon(
            Icons.settings,
            color: Colors.grey[600],
            size: 20,
          ),
        ],
      ),
    );
  }
}

class ProfileContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          // Profile Avatar and Info
          Column(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.orange[300],
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/profile_image.jpg',
                    fit: BoxFit.cover,
                    width: 80,
                    height: 80,
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(
                        Icons.person,
                        size: 40,
                        color: Colors.white,
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Ethan Carter',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Product Designer',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 2),
              Text(
                'San Francisco, CA',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),

          SizedBox(height: 24),

          // Skills Section
          SkillsSection(),

          SizedBox(height: 24),

          // About Section
          AboutSection(),

          SizedBox(height: 20),
        ],
      ),
    );
  }
}

class SkillsSection extends StatelessWidget {
  final List<String> skills = [
    'UI/UX Design',
    'User Research',
    'Prototyping',
    'Wireframing',
    'Design Systems',
    'Interaction Design',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Skills',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: skills.map((skill) => SkillChip(skill: skill)).toList(),
        ),
      ],
    );
  }
}

class SkillChip extends StatelessWidget {
  final String skill;

  const SkillChip({Key? key, required this.skill}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Text(
        skill,
        style: TextStyle(
          fontSize: 12,
          color: Colors.grey[700],
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class AboutSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 12),
        Text(
          'Ethan is a product designer with over 5 years of experience in creating user-centered designs. He specializes in UI/UX design, user research, and prototyping. Ethan is passionate about solving complex problems and creating intuitive and engaging user experiences.',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
            height: 1.5,
          ),
        ),
      ],
    );
  }
}

class ContactSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Contact',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 16),
          ContactItem(
            icon: Icons.email_outlined,
            text: 'ethan.carter@email.com',
            onTap: () {
              // Handle email tap
            },
          ),
          SizedBox(height: 12),
          ContactItem(
            icon: Icons.phone_outlined,
            text: '(555) 123-4567',
            onTap: () {
              // Handle phone tap
            },
          ),
          SizedBox(height: 12),
          ContactItem(
            icon: Icons.link,
            text: 'linkedin.com/in/ethancarter',
            onTap: () {
              // Handle LinkedIn tap
            },
          ),
        ],
      ),
    );
  }
}

class ContactItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const ContactItem({
    Key? key,
    required this.icon,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 4),
        child: Row(
          children: [
            Icon(
              icon,
              size: 20,
              color: Colors.grey[600],
            ),
            SizedBox(width: 12),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[700],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
