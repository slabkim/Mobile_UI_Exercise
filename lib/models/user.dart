/// Kelas model yang mewakili pengguna dalam aplikasi.
/// Berisi informasi pengguna seperti nama dan email.
class User {
  /// user full name
  final String name;

  /// user email address
  final String email;

  /// Constructor untuk membuat instance Pengguna
  const User({required this.name, required this.email});

  /// Membuat instance Pengguna dari peta JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(name: json['name'] as String, email: json['email'] as String);
  }

  /// Mengonversi instance Pengguna ke peta JSON
  Map<String, dynamic> toJson() {
    return {'name': name, 'email': email};
  }

  /// Membuat salinan Pengguna dengan nilai baru opsional
  User copyWith({String? name, String? email}) {
    return User(name: name ?? this.name, email: email ?? this.email);
  }

  @override
  String toString() {
    return 'User(name: $name, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is User && other.name == name && other.email == email;
  }

  @override
  int get hashCode => name.hashCode ^ email.hashCode;
}
