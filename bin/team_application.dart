import 'dart:math';

class Worrior {
  final int health;

  final String name;

  Worrior(this.health, this.name);

  @override
  String toString() => '** $name with health $health\n';
}

List<Worrior> generateTeam() {
  List<Worrior> team = [];
  final randomTeam = Random().nextInt(2) + 3;

  for (var i = 0; i < randomTeam; i++) {
    final randomHealth = Random().nextInt(50) + 50;
    int countTeam = i + 1;
    var worrier = "Worrier $countTeam";
    team.add(Worrior(randomHealth, worrier));
  }

  return team;
}

applyBattleTeam(String team, int wins) async {
  await Future.delayed(const Duration(seconds: 1));
  print("$team wins with $wins health points left");
  print('**\n');
}

void main() async {
  print("** Generating the teams");
  print('**');

  var teamA = generateTeam();
  var teamB = generateTeam();

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
    await Future.delayed(const Duration(seconds: 1));
    print("** $count\n");
  }

  await Future.delayed(const Duration(seconds: 1));
  print("** FIGHT\n");

  var myList = [...teamA, ...teamB];

  for (var _ in myList) {
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

      await Future.delayed(const Duration(seconds: 1));
      print('Team A $worrierA vs Team B $worrierB');

      if (teamA.first.health > teamB.first.health) {
        var wins = teamA.first.health - teamB.first.health;
        teamB.removeAt(0);
        teamA.removeAt(0);
        teamA.insert(0, Worrior(wins, worrierA));

        await applyBattleTeam("Team A", wins);
      } else {
        var wins = teamB.first.health - teamA.first.health;
        teamA.removeAt(0);
        teamB.removeAt(0);
        teamB.insert(0, Worrior(wins, worrierB));

        await applyBattleTeam("Team B", wins);
      }
    }
  }
}
