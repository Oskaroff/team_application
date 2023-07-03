import 'dart:math';

class Worrior  {
  final int health;

  final String name;

  Worrior(this.health, this.name);

  @override
  String toString() => '** $name with health $health\n';
}


void main() async {
  print("** Generating the teams");
  print('**');

  // TODO:
  // 1. return types ALWAYS!!!!
  // 2. Type annotations ALWAYS!!!
  // 3. Extract this function on a top level
  // 4. If function return something - it should starts with 'get' or 'fetch' or 'load'
   teamGenerationFunction() {
    var team = [];
    final randomTeam = Random().nextInt(2) + 3;

    for (var i = 0; i < randomTeam; i++) {
      final randomHealth = Random().nextInt(50) + 50;
      // TODO: omit type annotation
      int countTeam = i + 1;
      var worrier = "Worrier $countTeam";
      team.add(Worrior(randomHealth, worrier));
    }

    return team;
  }

  var teamA = teamGenerationFunction();
  var teamB = teamGenerationFunction();

  print("** Teams are ready to fight and they are:\n");

  print("Team A");
  teamA.forEach((element) => print(element));

  print('**\n');

  print("Team B");
  teamB.forEach((element) => print(element));

  print('**\n');

  print("** Let’s the battle begins!\n");

  for (var i = 0; i < 3; i++) {
    int count = 3 - i;
    // TODO: prefer async / await syntacsys
    await Future.delayed(const Duration(seconds: 1))
        .then((value) => print("** $count\n"));
  }

  // TODO: prefer async / await syntacsys
  await Future.delayed(const Duration(seconds: 1))
      .then((value) => print("** FIGHT\n"));


  var myList = [...teamA, ...teamB];


  // TODO: if you don't use any arguments from the for cycle - change to _
  for (var element in myList) {
    if (teamA.isEmpty) {
      print('Team B won the battle');
      return;
    }
    if (teamB.isEmpty) {
      print('Team A won the battle');
      return;
    } else {
      var worrierA = teamA.first.name;
      var worrierB = teamB.first.name;

      // TODO: if you don't use any arguments from the for cycle - change to _
      await Future.delayed(const Duration(seconds: 1))
          .then((value) => print('Team A $worrierA vs Team B $worrierB'));

      if (teamA.first.health > teamB.first.health) {
        var wins = teamA.first.health - teamB.first.health;
        teamB.removeAt(0);
        teamA.removeAt(0);
        teamA.insert(0, Worrior(wins, worrierA));

        // TODO: if you don't use any arguments from the for cycle - change to _
        await Future.delayed(const Duration(seconds: 1)).then(
            (value) => print("Team A wins with $wins health points left"));
        print('**\n');
      } else {
        var wins = teamB.first.health - teamA.first.health;
        teamA.removeAt(0);
        teamB.removeAt(0);
        teamB.insert(0, Worrior(wins, worrierB));

        // TODO: if you don't use any arguments from the for cycle - change to _
        await Future.delayed(const Duration(seconds: 1)).then(
            (value) => print("Team B wins with $wins health points left"));
        print('**\n');
      }
    }
  }
}
