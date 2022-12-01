class Validation {
  static bool _hasMatch(String? value, String pattern) {
    return (value == null) ? false : RegExp(pattern).hasMatch(value);
  }

  static bool email(String s) => _hasMatch(s,
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  static bool fullName(String s) => _hasMatch(s,
      r"^^[a-zA-ZàáảãạÀÁẢÃẠăằắẳẵặĂẰẮẲẴẶâầấẩẫậÂẦẤẨẪẬèéẻẽẹÈÉẺẼẸêềếểễệỀẾÊỂỄỆìíỉĩịÌÍỈĨỊòóỏõọÒÓỎÕỌôồốổỗộÔỒỐỔỖỘơờớởỡợƠỜỚỞỠỢùúủũụÙÚỦŨỤưừứửữựƯỪỨỬỮỰỳýỷỹỵỲÝỶỸỴđĐ]+(\s+[a-zA-ZàáảãạÀÁẢÃẠăằắẳẵặĂẰẮẲẴẶâầấẩẫậÂẦẤẨẪẬèéẻẽẹÈÉẺẼẸêềếểễệỀẾÊỂỄỆìíỉĩịÌÍỈĨỊòóỏõọÒÓỎÕỌôồốổỗộÔỒỐỔỖỘơờớởỡợƠỜỚỞỠỢùúủũụÙÚỦŨỤưừứửữựƯỪỨỬỮỰỳýỷỹỵỲÝỶỸỴđĐ]+)*$");

  static bool password(String s) => _hasMatch(
      s, r"^([A-Za-z]{2}\d{6,7})|([A-Za-z]\d{7})|([A-Za-z][A-Za-z0-9]{7,8})");

  static bool phone(String s) => _hasMatch(s,
      r"^0((3[23456789][0-9]{7})|(5[8629][0-9]{7})|(7[09768][0-9]{7})|(8[63451289][0-9]{7})|(9[678140329][0-9]{7}))");

  static bool number(String s) => _hasMatch(s, r"^[0-9]");

  static bool code(String s) => _hasMatch(s, r"^[0-9]{5,6}");
}
