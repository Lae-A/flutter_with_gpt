import 'package:flutter/material.dart';

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
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            thumbnailUrl,
            fit: BoxFit.cover,
            width: double.infinity,
            height: 120,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(profileImageUrl),
                  radius: 24,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        channelName,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        channelDescription,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
