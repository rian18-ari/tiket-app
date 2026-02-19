class TiketArticles {
  final int id;
  final String nama;
  final String email;
  final String updated_at;
  final String created_at;

  TiketArticles({
    required this.id,
    required this.nama,
    required this.email,
    required this.created_at,
    required this.updated_at,
  });

  factory TiketArticles.fromJson(Map<String, dynamic> json) {
    return TiketArticles(
      id: json['id'],
      nama: json['nama'],
      email: json['email'],
      created_at: json['created_at'],
      updated_at: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama': nama,
      'email': email,
      'created_at': created_at,
      'updated_at': updated_at,
    };
  }
}