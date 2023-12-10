class PenguinGame < Draco::World
  reset

  entity Penguin, as: :player

  systems PenguinController,
    Animate,
    RenderSprites,
    RenderLabels
end