import 'dart:convert';
import 'dart:math';

class Student {
  String name = '';
  int kor = 0;
  int eng = 0;
  int math = 0;
  double avg = 0.0;

  // 생성자에서 랜덤 점수 부여
  Student() {
    kor = Random().nextInt(99) + 1;
    eng = Random().nextInt(99) + 1;
    math = Random().nextInt(99) + 1;
  }

  // 평균 계산 메서드
  void setAvg() => avg = (kor + eng + math) / 3.0;
}

void main() {
  var alist = List<Student>.empty(growable: true);

  // 학생 10명 생성
  for (int i = 0; i < 10; i++) {
    Student a = Student();
    a.name = AsciiDecoder().convert([65 + i]); // 이름 A~J
    a.setAvg(); // 평균 계산
    alist.add(a);
  }

  String strTable = '이름  국어  영어  수학  평균 ';
  print(strTable);

  for (int i = 0; i < 10; i++) {
    print(alist[i].name.padLeft(4) +
        alist[i].kor.toString().padLeft(5) +
        alist[i].eng.toString().padLeft(5) +
        alist[i].math.toString().padLeft(5) +
        alist[i].avg.toStringAsFixed(2).padLeft(8));
  }

  print("\n[평균으로 정렬]");
  print(strTable + '비고');

  List<Student> newlist = List.from(alist);
  newlist.sort((a, b) => a.avg.compareTo(b.avg));

  for (var i in newlist) {
    String str = i.name.padLeft(4) +
        i.kor.toString().padLeft(5) +
        i.eng.toString().padLeft(5) +
        i.math.toString().padLeft(5) +
        i.avg.toStringAsFixed(2).padLeft(8);

    if (i.avg > 50.0) {
      str += "PASS".padLeft(5);
    } else {
      str += "FAIL".padLeft(5);
    }

    print(str);
  }
}
