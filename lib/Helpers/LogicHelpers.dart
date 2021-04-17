import 'package:homephiys/Entity/Report.dart';

class LogicHelpers {
  static List<Report> getReprotOfCurrentExerciseAndStage(List<Report> allReport,
      int stageLevel, int exerciseLevel) {
    List<Report> reports = [];
    for (int i = 0; i < allReport.length; i++) {
      if (allReport[i].stageLevel == stageLevel &&
          allReport[i].exerciseLevel == exerciseLevel) {
        reports.add(allReport[i]);
      }
    }
    return reports;
  }

  static double calculatePercentage(int score, int questionLength) {
    double TotalScore = (score / (questionLength * 5)) * 100;
    return TotalScore;
  }


  static int calculateScoreOfQuestions(List<int> answers) {
    int sum = 0;
    for (int i = 0; i < answers.length; i++) {
      sum += answers[i] + 1;
    }
    return sum;
  }


  static int getHigestScoreOfReport(List<Report> reports) {
    int higeScore = 0;
    for (int i = 0; i < reports.length; i++) {
      if(reports[i].score>higeScore){
        higeScore=reports[i].score;
      }
    }
    return higeScore;
  }
}