module Ludographics exposing (generateBoard)

import Html exposing(..)
import Color exposing (..)
import Element exposing (..)
import Collage exposing (..)

type alias Square = {x : Float, y : Float, size : Float, aColor : Color }

generateBoard : Html.Html msg
generateBoard =
    let
       board = [ {x = 0, y = 0, size = 10, aColor = red},
                 {x = 1, y = 0, size = 10, aColor = red},
                 {x = 2, y = 0, size = 10, aColor = red},
                 {x = 3, y = 0, size = 10, aColor = red},
                 {x = 4, y = 0, size = 10, aColor = red},
                 {x = 5, y = 0, size = 10, aColor = red},
                 {x = 6, y = 0, size = 10, aColor = red},
                 {x = 7, y = 0, size = 10, aColor = red},

                 {x = 7, y = -1, size = 10, aColor = red},
                 {x = 7, y = -2, size = 10, aColor = red},
                 {x = 7, y = -3, size = 10, aColor = red},
                 {x = 7, y = -4, size = 10, aColor = red},
                 {x = 7, y = -5, size = 10, aColor = red},
                 {x = 7, y = -6, size = 10, aColor = red} ]

       generateForms : List Square -> List Form
       generateForms board =
            case board of
                []         -> []
                head::tail -> (makeCircle head.aColor head.x head.y head.size) :: (generateForms tail)

       generateElement : List Form -> Element
       generateElement forms =
            collage 500 500 forms

       makeCircle : Color -> Float -> Float -> Float -> Form
       makeCircle color x y size =
         let
           padding = 2
           realSize = size * 2

           toRealPosition : Float -> Float
           toRealPosition x =
                (x * (realSize + padding))
         in
           (move (toRealPosition x, toRealPosition y) (filled color (circle size)))

    in
        toHtml (generateElement (generateForms board))