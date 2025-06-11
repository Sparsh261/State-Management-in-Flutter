import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final photo;

  const PostCard({Key? key, required this.photo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(12),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image from the URL
          Image.network(
            photo.thumbnailUrl,
            width: double.infinity,
            height: 150,
            fit: BoxFit.cover,
            loadingBuilder: (
              BuildContext context,
              Widget child,
              ImageChunkEvent? loadingProgress,
            ) {
              if (loadingProgress == null) return child;
              return Container(
                width: double.infinity,
                height: 150,
                color: Colors.grey[300],
                child: Center(
                  child: CircularProgressIndicator(
                    value:
                        loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                  ),
                ),
              );
            },
            errorBuilder: (
              BuildContext context,
              Object error,
              StackTrace? stackTrace,
            ) {
              return Container(
                width: double.infinity,
                height: 150,
                color: Colors.grey[300],
                alignment: Alignment.center,
                child: Text(
                  'Image not available',
                  style: TextStyle(color: Colors.black54),
                ),
              );
            },
          ),

          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  photo.title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),

                SizedBox(height: 8),

                Text('Album ID: ${photo.albumId}'),
                Text('Photo ID: ${photo.id}'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
