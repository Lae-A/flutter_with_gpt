import 'package:flutter/material.dart';
import 'youtube_grid_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController _nameController = TextEditingController(text: '이름');
  final TextEditingController _emailController = TextEditingController(text: 'email');
  bool _isEditing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _isEditing
                  ? TextField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        labelText: 'Name',
                        border: OutlineInputBorder(),
                      ),
                    )
                  : Text(
                      _nameController.text,
                      style: const TextStyle(fontSize: 20),
                    ),
              const SizedBox(height: 16),
              _isEditing
                  ? TextField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                      ),
                    )
                  : Text(
                      _emailController.text,
                      style: const TextStyle(fontSize: 20),
                    ),
              const SizedBox(height: 32), // 이메일과 버튼 사이의 여백을 넓히기 위해 32로 설정
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isEditing = !_isEditing;
                  });
                  if (!_isEditing) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Profile updated'),
                      ),
                    );
                  }
                },
                child: Text(_isEditing ? '저장하기' : '수정하기'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const YouTubeGridPage(), // YouTubeGridPage로 이동
                    ),
                  );
                },
                child: const Text('즐겨찾는 영상'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FavoriteTeachersPage(),
                    ),
                  );
                },
                child: const Text('즐겨찾는 강사'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FavoriteTeachersPage extends StatelessWidget {
  const FavoriteTeachersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Teachers'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          childAspectRatio: 16 / 9,
        ),
        itemCount: 6, // Example number of teachers
        itemBuilder: (context, index) {
          return Container(
            color: Colors.grey[300],
            child: Center(
              child: Text(
                'Teacher ${index + 1}',
                style: const TextStyle(fontSize: 18),
              ),
            ),
          );
        },
      ),
    );
  }
}
