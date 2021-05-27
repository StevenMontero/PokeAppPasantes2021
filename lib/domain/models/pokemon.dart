class Pokemon {
  String apiVersion = '';
  String name = '';
  String urlDetail = '';
  String urlImage = '';
  String firstSlot = '';
  String secondSlot = '';

  Pokemon({
    required this.name,
    required this.urlDetail,
    required this.urlImage,
    required this.firstSlot,
    this.secondSlot = '',
  });

  Pokemon.fromJsonPokeApi(
      {required Map<String, dynamic> json,
      required String apiVersion,
      required String urlImageApi}) {
    this.name = json['name'];
    this.urlDetail = json['url'];
    this.urlImage = urlImageApi;
    this.apiVersion = apiVersion;
  }
  Pokemon.fromJsonFirebase({
    required Map<String, dynamic> json,
  }) {
    this.name = json['name'];
    this.urlDetail = json['urlDetail'];
    this.urlImage = json['urlImage'];
    this.firstSlot = json['firstSlot'];
    this.secondSlot = json['secondSlot'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': this.name,
      'urlDetail': this.urlDetail,
      'urlImage': this.urlImage,
      'firstSlot': this.firstSlot,
      'secondSlot': this.secondSlot
    };
  }
}
