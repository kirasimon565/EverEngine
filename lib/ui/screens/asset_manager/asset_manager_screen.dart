import 'package:flutter/material.dart';

class AssetManagerScreen extends StatelessWidget {
  const AssetManagerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Asset Manager')),
      body: DefaultTabController(
        length: 5,
        child: Column(
          children: [
            const TabBar(
              tabs: [
                Tab(text: 'Images'),
                Tab(text: 'Audio'),
                Tab(text: 'Videos'),
                Tab(text: 'Fonts'),
                Tab(text: 'Other'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _buildAssetGrid(Icons.image),
                  _buildAssetGrid(Icons.audiotrack),
                  _buildAssetGrid(Icons.video_library),
                  _buildAssetGrid(Icons.font_download),
                  _buildAssetGrid(Icons.insert_drive_file),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: const Icon(Icons.file_upload),
        label: const Text('Import'),
      ),
    );
  }

  Widget _buildAssetGrid(IconData icon) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: 8,
      itemBuilder: (context, index) {
        return Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 48, color: Colors.grey),
              const SizedBox(height: 8),
              Text('Asset \$index', overflow: TextOverflow.ellipsis),
            ],
          ),
        );
      },
    );
  }
}
