class PeliculaModel {
  final int id;
  final String title;
  final String description;
  final int year;
  final String imageUrl;
  final String genre;
  final double stars;

  const PeliculaModel({
    required this.id,
    required this.title,
    required this.description,
    required this.year,
    required this.imageUrl,
    required this.genre,
    required this.stars,
  });

  factory PeliculaModel.fromJson(Map<String, dynamic> json) {
    return PeliculaModel(
      id: (json['id'] as num).toInt(),
      title: (json['title'] as String?) ?? '',
      description: (json['description'] as String?) ?? '',
      year: (json['year'] as num).toInt(),
      imageUrl: (json['image_url'] as String?) ?? '',
      genre: (json['genre'] as String?) ?? '',
      stars: (json['stars'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'description': description,
    'year': year,
    'image_url': imageUrl,
    'genre': genre,
    'stars': stars,
  };

  static List<PeliculaModel> listFromJson(List<dynamic> data) =>
      data.map((e) => PeliculaModel.fromJson(e as Map<String, dynamic>)).toList();
}
