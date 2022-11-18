import 'package:flutter/material.dart';
import 'package:ssm/src/models/models.dart';

List<Color> loginBackgroundColors = const [
  Color.fromARGB(255, 250, 250, 250),
  Color.fromARGB(255, 252, 244, 223),
  Color.fromARGB(255, 249, 237, 193),
  Color.fromARGB(255, 245, 230, 161)
];
Color mainColor = const Color.fromARGB(255, 245, 230, 161);
//443330
Color logoBackgroundColor = const Color.fromARGB(255, 44, 33, 30);
List<String> loginSlogans = const [
  "나 혼자 다 낼 수는 없어!",
  "이만큼이나 나올지 몰랐어...",
  "나는 이 정산 동의하지 못할세",
  "먹을 때는 좋았지?"
];

SUser testUser1 =
    const SUser(name: "만보80", email: "aksqh80@naver.com", userId: "천연가스버스");
SUser testUser2 =
    const SUser(name: "만보79", email: "sqh80@naver.com", userId: "천연버스");
SUser testUser3 =
    const SUser(name: "만보78", email: "ksqh80@naver.com", userId: "천연가스버");
Payment pay1 = Payment(
    userEmail: testUser1.email,
    price: 20000,
    users: ["김석주", "김태연", "이준구", "이우람"],
    time: 1231241241241);
Payment pay2 = Payment(
    userEmail: testUser2.email,
    price: 2123000,
    users: ["김석주", "김태연", "이준구", "이우람"],
    time: 1231241241241);
Payment pay3 = Payment(
    userEmail: testUser3.email,
    price: 201220,
    users: ["김석주", "김태연", "이준구", "이우람"],
    time: 1231241241241);
Settlement settle1 = Settlement(title: "결자해지", users: [
  "김석주",
  "김태연",
  "이준구",
  "이우람"
], payments: {
  "김석주": [pay1],
  "김태연": [pay2],
  "이준구": [pay3],
});
