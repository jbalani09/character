class CharacterModel {
  String? name;
  List? alternateNames;
  String? species;
  String? gender;
  String? house;
  String? dateOfBirth;
  int? yearOfBirth;
  bool? wizard;
  String? ancestry;
  String? eyeColour;
  String? hairColour;
  Wand? wand;
  String? patronus;
  bool? hogwartsStudent;
  bool? hogwartsStaff;
  String? actor;
  List? alternateActors;
  bool? alive;
  String? image;

  CharacterModel(
      {this.name,
        this.alternateNames,
        this.species,
        this.gender,
        this.house,
        this.dateOfBirth,
        this.yearOfBirth,
        this.wizard,
        this.ancestry,
        this.eyeColour,
        this.hairColour,
        this.wand,
        this.patronus,
        this.hogwartsStudent,
        this.hogwartsStaff,
        this.actor,
        this.alternateActors,
        this.alive,
        this.image});

  CharacterModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['alternate_names'] != null) {
      alternateNames = [];
      json['alternate_names'].forEach((v) {
        alternateNames!.add(v);
      });
    }
    species = json['species'];
    gender = json['gender'];
    house = json['house'];
    dateOfBirth = json['dateOfBirth'];
    yearOfBirth = json['yearOfBirth'];
    wizard = json['wizard'];
    ancestry = json['ancestry'];
    eyeColour = json['eyeColour'];
    hairColour = json['hairColour'];
    wand = json['wand'] != null ? Wand.fromJson(json['wand']) : null;
    patronus = json['patronus'];
    hogwartsStudent = json['hogwartsStudent'];
    hogwartsStaff = json['hogwartsStaff'];
    actor = json['actor'];
    if (json['alternate_actors'] != null) {
      alternateActors = [];
      json['alternate_actors'].forEach((v) {
        alternateActors!.add(v);
      });
    }
    alive = json['alive'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    if (alternateNames != null) {
      data['alternate_names'] =
          alternateNames!.map((v) => v.toJson()).toList();
    }
    data['species'] = species;
    data['gender'] = gender;
    data['house'] = house;
    data['dateOfBirth'] = dateOfBirth;
    data['yearOfBirth'] = yearOfBirth;
    data['wizard'] = wizard;
    data['ancestry'] = ancestry;
    data['eyeColour'] = eyeColour;
    data['hairColour'] = hairColour;
    if (wand != null) {
      data['wand'] = wand!.toJson();
    }
    data['patronus'] = patronus;
    data['hogwartsStudent'] = hogwartsStudent;
    data['hogwartsStaff'] = hogwartsStaff;
    data['actor'] = actor;
    if (alternateActors != null) {
      data['alternate_actors'] =
          alternateActors!.map((v) => v.toJson()).toList();
    }
    data['alive'] = alive;
    data['image'] = image;
    return data;
  }
}

class Wand {
  String? wood;
  String? core;
  int? length;

  Wand({this.wood, this.core, this.length});

  Wand.fromJson(Map<String, dynamic> json) {
    wood = json['wood'];
    core = json['core'];
    length = json['length'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['wood'] = wood;
    data['core'] = core;
    data['length'] = length;
    return data;
  }
}
