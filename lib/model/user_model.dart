class Users {
  List<SignupPayload>? userModelList;

  Users({this.userModelList});
  List<SignupPayload>? fromJson(List<dynamic> list) {
    userModelList = [];
    for (var e in list) {
      userModelList!.add(SignupPayload.fromJson(e));
    }
    return userModelList;
  }

  List<SignupPayload>? toJson(List<dynamic> list) {
    userModelList = [];
    for (var e in list) {
      userModelList!.add(SignupPayload());
    }
    return userModelList;
  }
}

class SignupPayload {
  Address? address;
  int? id;
  String? email;
  String? username;
  String? password;
  Name? name;
  String? phone;
  int? iV;

  SignupPayload(
      {this.email,
      this.iV,
      this.id,
      this.password,
      this.phone,
      this.username,
      this.address,
      this.name});

  SignupPayload.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    iV = json['iV'];
    id = json['id'];
    password = json['password'];
    phone = json['phone'];
    username = json['username'];
    address =
        json['address'] != null ? Address.fromJson(json['address']) : null;
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'phone': phone,
      'password': password,
      'username': username,
      'iv': iV,
      'address': address?.toJson(),
      'name': name?.toJson(),
    };
  }
}

class Address {
  Geolocation? geolocation;
  String? city;
  String? street;
  int? number;
  String? zipcode;

  Address(
      {this.city, this.number, this.street, this.zipcode, this.geolocation});

  Address.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    street = json['street'];
    number = json['number'];
    zipcode = json['zipcode'];
    geolocation = json['geolocation'] != null
        ? Geolocation.fromJson(json['geolocation'])
        : null;
  }

  Map<String, dynamic> toJson() {
    return {
      'city': city,
      'number': number,
      'street': street,
      'zipcode': zipcode,
      'geolocation': geolocation?.toJson()
    };
  }
}

class Geolocation {
  String? lat;
  String? long;

  Geolocation({this.lat, this.long});

  Geolocation.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    long = json['long'];
  }

  Map<String, dynamic> toJson() {
    return {'lat': lat, 'long': long};
  }
}

class Name {
  String? firstname;
  String? lastname;

  Name({this.firstname, this.lastname});

  Name.fromJson(Map<String, dynamic> json) {
    firstname = json['firstname'];
    lastname = json['lastname'];
  }

  Map<String, dynamic> toJson() {
    return {
      'firstname': firstname,
      'lastname': lastname,
    };
  }
}
