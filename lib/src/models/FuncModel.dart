class FuncModel {
  int? _id;
  String? _name;
  String? _role;

  FuncModel({int? id, String? name, String? role}) {
    if (id != null) {
      this._id = id;
    }
    if (name != null) {
      this._name = name;
    }
    if (role != null) {
      this._role = role;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get role => _role;
  set role(String? role) => _role = role;

  FuncModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['role'] = this._role;
    return data;
  }
}