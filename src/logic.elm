module Logic exposing(Model, move1, back1, eaten)

type alias Model = Int

move1: Model -> Model
move1 model = model + 1

back1: Model -> Model
back1 model = model - 1

eaten: Model -> Model
eaten model = 0