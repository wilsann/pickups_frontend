part of 'models.dart';

enum TrashType { organic, anorganic }

class Trash extends Equatable {
  final int id;
  final String name;
  final String description;
  final int price;
  final String picturePath;

  Trash({this.id, this.name, this.description, this.price, this.picturePath});

  factory Trash.fromJson(Map<String, dynamic> data) => Trash(
      id: data['id'],
      name: data['name'],
      description: data['description'],
      price: data['price'],
      picturePath: data['picturePath']);

  @override
  List<Object> get props => [id, name, description, price, picturePath];
}

List<Trash> mockTrash = [
  Trash(
      id: 1,
      picturePath:
          "https://asset.kompas.com/crops/EAVjjN273qmYXTtuNlfjYzH83OQ=/203x91:1297x821/750x500/data/photo/2021/12/02/61a8e14a63944.jpg",
      name: "Botol Plastik",
      description:
          "Botol plastik adalah sebuah botol yang terbuat dari plastik. Botol plastik biasanya dipakai untuk menyimpan cairan seperti air, minuman ringan, oli motor, minyak masak, obat, sampo, susu dan tinta. Ukurannya beragam dari botol sampel yang sangat kecil sampai carboy besar.",
      price: 5000),
  Trash(
      id: 2,
      picturePath:
          "https://images.tokopedia.net/img/cache/500-square/VqbcmM/2021/7/1/b78cbde3-afd2-47a3-8a40-f0fc4588d1b0.jpg",
      name: "Kardus",
      description:
          "Kardus adalah salah satu tipe kemasan yang biasanya terbuat dari bahan kertas kraft yang dibuat menjadi bahan bergelombang dengan ketinggian dan ketebalan gelombang tertentu.",
      price: 4000),
  Trash(
      id: 3,
      picturePath:
          "https://sc04.alicdn.com/kf/U0deb9d29e9274519b4115a219ee80395i.jpg",
      name: "Kertas",
      description:
          "Kertas adalah bahan tipis yang dihasilkan dari kompresi serat yang berasal dari pulp. Serat yang digunakan biasanya berbahan alami dan mengandung selulosa dan hemiselulosa.",
      price: 3000),
  Trash(
      id: 4,
      picturePath:
          "https://asset.kompas.com/crops/xkd3L6sLcLyr9yjVr7n64IeULvc=/71x63:944x645/750x500/data/photo/2021/03/17/60515c26de892.jpg",
      name: "Minyak Jelantah",
      description:
          "Minyak jelantah adalah minyak yang telah digunakan lebih dari dua atau tiga kali penggorengan, dan dikategorikan sebagai limbah karena dapat merusak lingkungan dan merugikan kesehatan.",
      price: 3000),
];
