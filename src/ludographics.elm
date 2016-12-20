module LudoGraphics exposing (generateBoard)

import Html exposing(..)
import Color exposing (..)
import Element exposing (..)
import Collage exposing (..)

import Data exposing(Square, board)

generateBoard : Html.Html msg
generateBoard =
    let
       collageSize = 380

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

       generateForms : List Square -> List Form
       generateForms board =
            case board of
                []         -> []
                head::tail -> (makeCircle head.aColor head.x head.y head.size) :: (generateForms tail)

       generateElement : List Form -> Element
       generateElement forms =
            collage collageSize collageSize forms

    in
        toHtml (generateElement (generateForms board))