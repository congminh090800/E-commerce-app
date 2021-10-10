class Tutor {
  String id;
  String name;
  double rating = 0.0;
  String summary = "";
  String avartarImg = "";
  String countryCode;
  List<String> specialities = [];
  List<String> tutorLanguages = [];
  String interests = "";
  String experience = "";
  Tutor(
      this.id,
      this.name,
      this.rating,
      this.summary,
      this.specialities,
      this.avartarImg,
      this.countryCode,
      this.tutorLanguages,
      this.interests,
      this.experience);
}
