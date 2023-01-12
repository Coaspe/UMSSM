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
    const SUser(name: "만보80", email: "achoe628@gmail.com", userId: "천연가스버스");
SUser testUser2 =
    const SUser(name: "만보79", email: "achoe628@gmail.com", userId: "천연버스");
SUser testUser3 =
    const SUser(name: "만보78", email: "achoe628@gmail.com", userId: "천연가스버");
Payment pay1 = Payment(
    user: testUser1.email,
    where: "편의점",
    what: "맥주 4개",
    price: 20000,
    users: ["김석주", "김태연", "이준구", "이우람"],
    time: 1231241241241);
Payment pay2 = Payment(
    user: testUser2.email,
    where: "슈퍼",
    what: "여러 식자재",
    price: 2123000,
    users: ["김석주", "김태연", "이준구", "이우람"],
    time: 1231241241241);
Payment pay3 = Payment(
    user: testUser3.email,
    where: "조양 슈퍼",
    what: "와인",
    price: 201220,
    users: ["김석주", "김태연", "이준구", "이우람"],
    time: 1231241241241);
Settlement settle1 = Settlement(
  payments: [pay1, pay2, pay3],
  title: "결자해지",
  desc: "논현짠물모임",
  users: ["김석주", "김태연", "이준구", "이우람"],
);

Map<Currency, String> currencyToEmoji = {
  Currency.won: "￦",
  Currency.dollor: "\$",
};
