import 'dart:convert';
import 'dart:math';

// 학생 클래스 정의
class Student {
  String name = '';
  int kor = 0;
  int eng = 0;
  int math = 0;
  double avg = 0.0;

  // 생성자에서 랜덤 점수 설정
  Student() {
    kor = Random().nextInt(99) + 1;
    eng = Random().nextInt(99) + 1;
    math = Random().nextInt(99) + 1;
  }

  // 평균 계산 메서드
  void calculateAvg() {
    avg = (kor + eng + math) / 3.0;
  }
}

void main() {
  var alist = List<Student>.empty(growable: true);

  // 5명의 학생 생성
  for (int i = 0; i < 5; i++) {
    Student a = Student();
    a.name = AsciiDecoder().convert([65 + i]); // 이름 A~E
    a.calculateAvg(); // 평균 계산
    alist.add(a);
  }

  print('이름, 국어, 영어, 수학, 평균');
  for (var student in alist) {
    print('${student.name}, ${student.kor}, ${student.eng}, ${student.math}, ${student.avg.toStringAsFixed(2)}');
  }

  print('\n[평균으로 정렬]');
  var newlist = List<Student>.from(alist);
  newlist.sort((a, b) => a.avg.compareTo(b.avg));

  for (var student in newlist) {
    print('${student.name}, ${student.kor}, ${student.eng}, ${student.math}, ${student.avg.toStringAsFixed(2)}');
  }
}
