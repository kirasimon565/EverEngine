import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../state/state.dart';

class ProjectHubScreen extends ConsumerWidget {
  const ProjectHubScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectState = ref.watch(projectProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('EverEngine'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          )
        ],
      ),
      body: projectState.recentProjects.isEmpty
          ? const Center(child: Text('Create your first game'))
          : ListView.builder(
              itemCount: projectState.recentProjects.length,
              itemBuilder: (context, index) {
                final project = projectState.recentProjects[index];
                return ListTile(
                  title: Text(project.name),
                  subtitle: Text('Last modified: \${project.updatedAt}'),
                  onTap: () {
                    // Navigate to editor
                    ref
                        .read(projectProvider.notifier)
                        .openProject(project.projectDir);
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          // Open New Project Dialog
        },
      ),
    );
  }
}
