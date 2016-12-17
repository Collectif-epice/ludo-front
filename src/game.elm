import Html exposing (text, Html, div)
import Collage exposing (collage)

{-- custom modules imports --}
import Logic exposing(..)
import Api exposing(..)

main =
  Html.beginnerProgram {model = model, update = update, view = view}

{-- model --}
model : Model
model = 0

{-- view --}
view : Model -> Html Event
view model =
    div []
        [ text (toString model) ]

{-- update --}
{--
    Move1        : Move 1 square further
    Back1        : Move 1 square back
    Eaten        : Is Eaten and go back to the stable
    HasSix       : Threw a 6
    DiceThrow    : Throw a dice
    MadeFullTurn : Has been able to make a full turn
    Win          : Won the game
    Lose         : Lose the game

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




