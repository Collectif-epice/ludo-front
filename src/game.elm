import Html exposing (text, Html, div, button)
import Html.Events exposing (onClick)

-- custom modules imports --
import Api exposing(..)
import LudoGraphics exposing(..)
import Data exposing(..)

main =
  Html.beginnerProgram {model = model, update = update, view = view}

-- model --
type alias Model =  {board : Board, data : Int }
model = { board = board  , data = 0}


-- view --
view : Model -> Html Event
view model =
    div []
        [ button [onClick Move1] [text "Move 1"],
          button [onClick Back1] [text "Back 1"],
          button [onClick Eaten] [text "Eaten"],
          generateBoard ]

-- update --
{--
    Move1        : Move 1 square further
    Back1        : Move 1 square back
    Eaten        : Is Eaten and go back to the stable
    HasSix       : Threw a 6
    DiceThrow    : Throw a dice
    MadeFullTurn : Has been able to make a full turn
    Win          : Won the game
    Lose         : Lose the game

    type Player = String Int
    use Union types for Events ..
--}
type Event = Move1 | Back1 | Eaten {-- | DiceThrow | HasSix | MadeFullTurn | Win | Lose --}

update :  Event -> Model -> Model
update event model =
    case event of
        Move1 ->
            move1 model
        Back1 ->
            back1 model
        Eaten ->
            eaten model

move1: Model -> Model
move1 model =
    {model | data = model.data + 1}

back1: Model -> Model
back1 model =
    {model | data = model.data - 1}

eaten: Model -> Model
eaten model =
    {model | data = 0}



