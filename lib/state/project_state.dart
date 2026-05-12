import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/project_system/project.dart';

class ProjectState {
  final List<Project> recentProjects;
  final Project? currentProject;
  final bool isLoading;
  final String? errorMessage;

  const ProjectState({
    this.recentProjects = const [],
    this.currentProject,
    this.isLoading = false,
    this.errorMessage,
  });

  ProjectState copyWith({
    List<Project>? recentProjects,
    Project? currentProject,
    bool? isLoading,
    String? errorMessage,
    bool clearCurrentProject = false,
  }) {
    return ProjectState(
      recentProjects: recentProjects ?? this.recentProjects,
      currentProject: clearCurrentProject ? null : (currentProject ?? this.currentProject),
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

class ProjectNotifier extends StateNotifier<ProjectState> {
  ProjectNotifier() : super(const ProjectState());

  Future<void> loadRecentProjects() async {
    state = state.copyWith(isLoading: true);
    // Fetch logic mock
    state = state.copyWith(isLoading: false, recentProjects: []);
  }

  Future<void> createProject(Project project) async {
    state = state.copyWith(isLoading: true);
    final projects = List<Project>.from(state.recentProjects)..add(project);
    state = state.copyWith(isLoading: false, recentProjects: projects, currentProject: project);
  }

  Future<void> openProject(String dir) async {
    // Open project mock
  }

  Future<void> closeProject() async {
    state = state.copyWith(clearCurrentProject: true);
  }

  Future<void> deleteProject(Project project) async {
    state = state.copyWith(isLoading: true);
    final projects = List<Project>.from(state.recentProjects)..removeWhere((p) => p.name == project.name);
    state = state.copyWith(isLoading: false, recentProjects: projects);
  }
}

final projectProvider = StateNotifierProvider<ProjectNotifier, ProjectState>((ref) {
  return ProjectNotifier();
});
