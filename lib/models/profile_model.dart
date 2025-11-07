class ProfileModel {
  final String name;
  final String userID;
  final String? pictureUrl;
  final String displayName;
  ProfileModel({
    required this.name,
    required this.userID,
    required this.displayName,
    this.pictureUrl,
  });

  factory ProfileModel.fromJson(Map<dynamic, dynamic> json) {
    return ProfileModel(
      name: json['name'] as String? ?? "",
      userID: json['userId'] as String? ?? "",
      displayName: json['displayName'] as String? ?? json['name'],
      pictureUrl: json['pictureUrl'],
    );
  }
}
