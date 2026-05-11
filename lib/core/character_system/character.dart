class Character {
  final String id;
  final String displayName;
  final String? avatarPath;
  final int typingSpeedMs;
  final String bubbleColor;
  final String? typingSoundPath;
  final String onlineStatus;
  final String? onlineSchedule;
  final String? lastSeenMessage;
  final List<String> tags;
  final String? group;
  final String? conditionToShow;
  final Map<String, String> metadata;

  const Character({
    required this.id,
    required this.displayName,
    this.avatarPath,
    this.typingSpeedMs = 80,
    this.bubbleColor = '#2D2D44',
    this.typingSoundPath,
    this.onlineStatus = 'always_online',
    this.onlineSchedule,
    this.lastSeenMessage,
    this.tags = const [],
    this.group,
    this.conditionToShow,
    this.metadata = const {},
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'displayName': displayName,
      if (avatarPath != null) 'avatarPath': avatarPath,
      'typingSpeedMs': typingSpeedMs,
      'bubbleColor': bubbleColor,
      if (typingSoundPath != null) 'typingSoundPath': typingSoundPath,
      'onlineStatus': onlineStatus,
      if (onlineSchedule != null) 'onlineSchedule': onlineSchedule,
      if (lastSeenMessage != null) 'lastSeenMessage': lastSeenMessage,
      'tags': tags,
      if (group != null) 'group': group,
      if (conditionToShow != null) 'conditionToShow': conditionToShow,
      'metadata': metadata,
    };
  }

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['id'] as String,
      displayName: json['displayName'] as String,
      avatarPath: json['avatarPath'] as String?,
      typingSpeedMs: json['typingSpeedMs'] as int? ?? 80,
      bubbleColor: json['bubbleColor'] as String? ?? '#2D2D44',
      typingSoundPath: json['typingSoundPath'] as String?,
      onlineStatus: json['onlineStatus'] as String? ?? 'always_online',
      onlineSchedule: json['onlineSchedule'] as String?,
      lastSeenMessage: json['lastSeenMessage'] as String?,
      tags: (json['tags'] as List?)?.cast<String>() ?? [],
      group: json['group'] as String?,
      conditionToShow: json['conditionToShow'] as String?,
      metadata: (json['metadata'] as Map<String, dynamic>?)
              ?.map((k, v) => MapEntry(k, v.toString())) ??
          {},
    );
  }
}
