class MenuModel {
  MenuModel({
    required this.id,
    required this.namaMenu,
    required this.deskripsi,
    required this.thumbnail,
    required this.harga,
  });

  final int id;
  final String namaMenu;
  final String deskripsi;
  final String thumbnail;
  final int harga;

  factory MenuModel.fromJson(Map<String, dynamic> json) => MenuModel(
        id: json["Id"],
        namaMenu: json["nama_menu"],
        deskripsi: json["deskripsi"],
        thumbnail: json["thumbnail"],
        harga: json["harga"],
      );
}
