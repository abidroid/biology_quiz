class Question {
  String q;
  String a;
  String b;
  String c;
  String d;
  String ans;
  String exp;
  String img;

  Question(
      {this.q, this.a, this.b, this.c, this.d, this.ans, this.exp, this.img});

  factory Question.fromJSON( Map<String, dynamic> map ){

    return Question(
      q: map['q'],
      a: map['a'],
      b: map['b'],
      c: map['c'],
      d: map['d'],
      ans: map['ans'],
      exp: map['exp'],
      img: map['img']

    );
  }
}
