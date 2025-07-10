import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: const ImageGallery(),
//     );
//   }
// }

class ImageGallery extends StatefulWidget {
  const ImageGallery({super.key});

  @override
  State<ImageGallery> createState() => _ImageGalleryState();
}

class _ImageGalleryState extends State<ImageGallery> {
  final List<String> _images = [
    //'https:
    'https://picsum.photos/200/301',
    //'https:
    'https://picsum.photos/200/303',
  ];

  String _selectedImage = '';

  void _selectImage(String image) {
    setState(() {
      _selectedImage = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Gallery'),
      ),
      body: Column(
        children: [
          _selectedImage.isNotEmpty
              ? Image.network(
            _selectedImage,
            height: 300,
            width: double.infinity,
            fit: BoxFit.cover,
          )
              : Container(
            height: 300,
            width: double.infinity,
            color: Colors.grey,
            child: const Center(
              child: Text('Select an image'),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _images.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    _selectImage(_images[index]);
                  },
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: Image.network(
                      _images[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}