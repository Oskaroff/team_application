import 'dart:math';

abstract class Team {
  abstract final int health;
  abstract final String worrier;
}

class TeamA extends Team {
  @override
  final int health;

  @override
  final String worrier;

  TeamA(this.health, this.worrier);

  @override
  String toString() => '** $worrier with health $health\n';
}

class TeamB extends Team {
  @override
  final int health;

  @override
  final String worrier;

  TeamB(this.health, this.worrier);

  @override
  String toString() => '** $worrier with health $health\n';
}

void main() async {
  print("** Generating the teams");
  print('**');

  teamGenerationFunction(teamName) {
    var team = [];
    final randomTeam = Random().nextInt(2) + 3;

    for (var i = 0; i < randomTeam; i++) {
      final randomHealth = Random().nextInt(50) + 50;
      int countTeam = i + 1;
      var worrier = "Worrier $countTeam";

      teamName == "TeamA"
          ? team.add(TeamA(randomHealth, worrier))
          : team.add(TeamB(randomHealth, worrier));
    }

    return team;
  }

  var teamA = teamGenerationFunction("TeamA");
  var teamB = teamGenerationFunction("TeamB");

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
    await Future.delayed(const Duration(seconds: 1))
        .then((value) => print("** $count\n"));
  }

  await Future.delayed(const Duration(seconds: 1))
      .then((value) => print("** FIGHT\n"));

  var myList = [...teamA, ...teamB];

  for (var element in myList) {
    if (teamA.isEmpty) {
      print('Team B won the battle');
      return;
    }
    if (teamB.isEmpty) {
      print('Team A won the battle');
      return;
    } else {
      var worrierA = teamA.first.worrier;
      var worrierB = teamB.first.worrier;

      await Future.delayed(const Duration(seconds: 1))
          .then((value) => print('Team A $worrierA vs Team B $worrierB'));

      if (teamA.first.health > teamB.first.health) {
        var wins = teamA.first.health - teamB.first.health;
        teamB.removeAt(0);
        teamA.removeAt(0);
        teamA.insert(0, TeamA(wins, worrierA));

        await Future.delayed(const Duration(seconds: 1)).then(
            (value) => print("Team A wins with $wins health points left"));
        print('**\n');
      } else {
        var wins = teamB.first.health - teamA.first.health;
        teamA.removeAt(0);
        teamB.removeAt(0);
        teamB.insert(0, TeamB(wins, worrierB));

        await Future.delayed(const Duration(seconds: 1)).then(
            (value) => print("Team B wins with $wins health points left"));
        print('**\n');
      }
    }
  }
}
