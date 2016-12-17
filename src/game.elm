import Html exposing (text, Html, div)

{-- custom modules imports --}
import Logic exposing(..)
import Api exposing(..)
import Ludographics exposing(..)

main =
  Html.beginnerProgram {model = model, update = update, view = view}

{-- model --}
{-- A list of states to execute ? The server will send a stream of events --}
model : Model
model = 0

{-- type RealModel = { players = [] , events = [] } --}

{-- view --}
view : Model -> Html Event
view model =
    div []
        [ text (toString model),
          generateBoard ]

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




