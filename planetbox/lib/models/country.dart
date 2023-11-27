class CountryClass {
  String cname = '';
  String name = '';
  List latlng = [];
  String flag = '';
  List capital = [];
  int population = 0;

  CountryClass(String c, String s, List l, String f, List cap, int p) {
    this.cname = c;
    this.name = s;
    this.latlng = l;
    this.flag = f;
    this.capital = cap;
    this.population = p;
  }
}
