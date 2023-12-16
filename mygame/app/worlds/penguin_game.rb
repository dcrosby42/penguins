class PenguinGame < Draco::World
  reset

  entity Penguin, as: :player

  systems PenguinController,
    AnimationSystem,
    RenderSprites,
    RenderLabels
end