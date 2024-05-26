import 'package:flutter/material.dart';
import 'teacher_profile_page.dart' show TeacherProfilePage; // TeacherProfilePage를 import합니다.

class YouTubeGridPage extends StatefulWidget {
  const YouTubeGridPage({Key? key}) : super(key: key);

  @override
  _YouTubeGridPageState createState() => _YouTubeGridPageState();
}

class _YouTubeGridPageState extends State<YouTubeGridPage> {
  String _selectedSort = 'Newest';

  // 예시 데이터: 각 영상에 대한 썸네일 URL 및 프로필 이미지 URL 목록
  final List<String> thumbnailUrls = [
    'https://i.ytimg.com/an_webp/LS8xXMLdLe4/mqdefault_6s.webp?du=3000&sqp=CMycy7IG&rs=AOn4CLDx-wa5yA7YCPF9pUVGqDQv4YlDpg',
    'https://via.placeholder.com/150/00FF00',
    'https://via.placeholder.com/150/0000FF',
    // 나머지 썸네일 URL들을 추가하십시오...
  ];

  final List<String> profileImageUrls = [
    'https://yt3.googleusercontent.com/ytc/AIdro_kAxImEAsUW2hihVpnUPMSZbwNRmy9rG6KRVzCgUJZ4eg=s160-c-k-c0x00ffffff-no-rj',
    'https://via.placeholder.com/50/00FF00',
    'https://via.placeholder.com/50/0000FF',
    // 나머지 프로필 이미지 URL들을 추가하십시오...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Videos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                DropdownButton<String>(
                  value: _selectedSort,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedSort = newValue!;
                    });
                  },
                  items: <String>['Newest', 'Oldest', 'Most Viewed', 'Highest Rated']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  childAspectRatio: 9 / 10,
                ),
                itemCount: thumbnailUrls.length, // 예시 데이터의 길이만큼 아이템 생성
                itemBuilder: (context, index) {
                  return YouTubeVideoCard(
                    thumbnailUrl: thumbnailUrls[index],
                    profileImageUrl: profileImageUrls[index],
                    channelName: 'Channel ${index + 1}', // 각각의 칸에 고유한 채널명을 지정할 수 있습니다.
                    channelDescription: 'Channel description ${index + 1}', // 각각의 칸에 고유한 채널 설명을 지정할 수 있습니다.
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class YouTubeVideoCard extends StatelessWidget {
  final String thumbnailUrl;
  final String profileImageUrl;
  final String channelName;
  final String channelDescription;

  const YouTubeVideoCard({
    Key? key,
    required this.thumbnailUrl,
    required this.profileImageUrl,
    required this.channelName,
    required this.channelDescription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // 강사의 프로필 페이지로 이동합니다.
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TeacherProfilePage(
              profileImageUrl: profileImageUrl,
              teacherName: channelName,
              teacherInfo: channelDescription,
            ),
          ),
        );
      },
      child: Card(
        // 썸네일과 관련된 내용들...
        // 나머지 썸네일 카드 구현...
      ),
    );
  }
}
