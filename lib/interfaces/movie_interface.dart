class Movies {
  String? id;
  String videoName;
  String videoImage;
  String videoLink;
  String description;
  String? releaseDate;
  String category;

  Movies ({
    required this.id,
    required this.videoName,
    required this.videoImage,
    required this.videoLink,
    required this.description,
    required this.releaseDate,
    required this.category
  });

  Movies.withoutID({
    required this.videoName,
    required this.videoImage,
    required this.videoLink,
    required this.description,
    required this.releaseDate,
    required this.category
  });

  factory Movies.fromJson(Map<String, dynamic> parsedJson) {
    print(parsedJson);
    return Movies(
      id:parsedJson['_id'],
      videoName: parsedJson['videoName'],
      videoImage: parsedJson['videoImage'],
      videoLink: parsedJson['videoLink'],
      description: parsedJson['description'],
      releaseDate: parsedJson['releaseDate'],
      category: parsedJson['category'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'videoName': videoName,
    'videoImage': videoImage,
    'videoLink': videoLink,
    'description': description,
    'releaseDate': releaseDate,
    'category': category
  };

}