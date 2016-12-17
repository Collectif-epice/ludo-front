module Ludographics exposing (generateBoard)

import Html exposing(..)
import Color exposing (..)
import Element exposing (..)
import Collage exposing (..)

type alias Square = {x : Float, y : Float, aColor : Color }

generateBoard : Html.Html msg
generateBoard =
    let
       board = [ {x = 30, y = 30, aColor = blue},
                 {x = 60, y = 60, aColor = red },
                 {x = 60, y = 35, aColor = green} ]

       generateForms : List Square -> List Form
       generateForms board =
            case board of
                []         -> []
                head::tail -> (move (head.x, head.y) (makeCircle head.aColor)) :: (generateForms tail)

       generateElement : List Form -> Element
       generateElement forms =
            collage 500 500 forms
    in
        toHtml (generateElement (generateForms board))

makeCircle color =
  filled color (circle 5)