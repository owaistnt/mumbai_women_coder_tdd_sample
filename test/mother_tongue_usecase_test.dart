import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:test_driven_app/mother_tongue_usecase.dart';

class MockRepo extends Mock implements ISouthAsianCountriesRepo {}

MotherTongueUsecase usecase;
MockRepo mockRepo;

void main() {
  group("Default Conditions", () {
    test(
        "If User has stayed only in south Asian Countries then don't add anything",
        () {
      //Arrange
      setup();
      //Act
      var result = usecase.getMotherTongue(["india", "pakistan"], {"punjabi"});
      //Assert
      expect(["punjabi"], result);
    });

    test(
        "If User has stayed in any south Asian Countries only specifically in India then add Hindi.",
        () {
      //Arrange
      setup();
      //Act
      var result = usecase.getMotherTongue(["india"], {"punjabi"});
      //Assert
      expect({"punjabi", "hindi"}, result);
    });

    test(
        "If User has stayed in any south Asian Countries only specifically in Pakistan or Afghanistan then add Urdu",
        () {
      //Arrange
      setup();
      //Act
      var result = usecase.getMotherTongue(["pakistan"], {"arabic"});
      //Assert
      expect({"arabic", "urdu"}, result);
    });

    test(
        "If User has stayed in any south Asian Countries only specifically in Afghanistan then add Urdu",
        () {
      //Arrange
      setup();
      //Act
      var result = usecase.getMotherTongue(["afghanistan"], {"arabic"});
      //Assert
      expect({"arabic", "urdu"}, result);
    });

    test(
        "If User is have stayed in any non south Asian Countries then add English in their languages",
        () {
      setup();

      var result = usecase.getMotherTongue(
          ["afghanistan", "india", "canada"], {"arabic", "hindi"});

      expect({"arabic", "hindi", "english"}, result);
      verify(mockRepo.getCountries());
    });
  });
}

MotherTongueUsecase setup() {
  mockRepo = MockRepo();
  usecase = MotherTongueUsecase(repo: mockRepo);
  when(mockRepo.getCountries())
      .thenReturn(["india", "pakistan", "afghanistan", "bangladesh"]);
}
