
class MotherTongueUsecase{

  ISouthAsianCountriesRepo repo;

  MotherTongueUsecase({this.repo});

  Set<String> getMotherTongue(
      List<String> countries,
      Set<String> languages) {

    if(countries.length==1) {
      if (countries.contains("india")) {
        languages.add("hindi");
        return languages;
      }else if(countries.contains("pakistan") || countries.contains("afghanistan")) {
        languages.add("urdu");
        return languages;
      }
    }else{
      var saarc=repo.getCountries();
      bool hasNonSouthAsianCountry=false;
      countries.forEach((item){
        if(!saarc.contains(item)){
          hasNonSouthAsianCountry=true;
        }
      });
      if(hasNonSouthAsianCountry) {
        languages.add("english");
        return languages;
      }
    }
    return languages;
  }

}



abstract class ISouthAsianCountriesRepo {
  List<String> getCountries() {}
}