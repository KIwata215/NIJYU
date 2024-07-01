class Player {
  String name;//名前
  String category;//飲むお酒
  int score;//今までの合計スコア
  int remainingMath; // 残りマス数
  int plusscore;

  Player(
      {required this.name,  
      required this.category, 
      required this.score,  
      required this.remainingMath,
      required this.plusscore});
}
