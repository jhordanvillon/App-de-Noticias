class Usuario{
  String id;
  String nombre;
  String email;

  Usuario({
    this.id,
    this.nombre,
    this.email,
  });

  factory Usuario.fromJson(Map<String,dynamic> json){
    return Usuario(
      id: json['id'],
      nombre: json['nombre'],
      email: json['email'],
    );
  }
}