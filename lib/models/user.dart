/// Model pengguna dengan nama dan email
class User {
  /// Nama lengkap pengguna
  final String name;

  /// Email pengguna
  final String email;

  /// Constructor untuk membuat instance User
  const User({required this.name, required this.email});

  /// Konversi dari JSON ke User
  factory User.fromJson(Map<String, dynamic> json) {
    return User(name: json['name'] as String, email: json['email'] as String);
  }

  /// Konversi User ke JSON
  Map<String, dynamic> toJson() {
    return {'name': name, 'email': email};
  }

  /// Duplikat User dengan nilai baru opsional
  User copyWith({String? name, String? email}) {
    return User(name: name ?? this.name, email: email ?? this.email);
  }

  /// Tampilkan info user
  @override
  String toString() {
    return 'User(name: $name, email: $email)';
  }

  /// Bandingkan dua user berdasarkan nama dan email
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is User && other.name == name && other.email == email;
  }

  /// Hash code berdasarkan nama dan email
  @override
  int get hashCode => name.hashCode ^ email.hashCode;
}
