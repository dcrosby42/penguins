class PenguinGame < Draco::World
  reset

  entity Player, as: :player

  systems HandleInput,
    Animate,
    RenderSprites,
    RenderLabels
end