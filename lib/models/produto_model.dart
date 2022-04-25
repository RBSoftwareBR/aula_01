class Projeto {
  String id;
DateTime data_inicio;


Projeto({this.data_inicio});

  factory Projeto.fromMap(dynamic map) {
    return Projeto(
      data_inicio: null == map['data_inicio']
          ? null
          : DateTime.fromMillisecondsSinceEpoch(map['data_inicio']),
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'data_inicio': data_inicio==null? null: data_inicio.millisecondsSinceEpoch,
    };
  }
}