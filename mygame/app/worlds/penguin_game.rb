class PenguinGame < Draco::World
  entity Player, as: :player

  systems HandleInput,
    RenderSprites,
    RenderLabels

  # entity Background
  # entity Title
  # entity GameStory
  # entity GameInstructions
  # entity StartGameInstructions

  # systems UpdateAttackCooldown,
  #   UpdateCountdown,
  #   MoveLasers,
  #   EnemyCombat,
  #   EnemyMovement,
  #   HandleInput,
  #   KeepInScreen,
  #   SpawnLasers,
  #   HandleEnemyLaserCollision,
  #   HandlePlayerLaserCollision,
  #   HandleDestroyed,
  #   Animate,
  #   CleanupAnimations,
  #   HandleGameOver,
  #   HandleGameWin,
  #   RenderSprites,
  #   UpdatePlanetHealth,
  #   RenderLabels
end