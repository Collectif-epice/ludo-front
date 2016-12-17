module Ludographics exposing (generateBoard)

import Html exposing(..)
import Color exposing (..)
import Element exposing (..)
import Collage exposing (..)

type alias Square = {x : Float, y : Float, size : Float, aColor : Color }
{- Create types for the board list (aka need circles for slots and for stable etc..) -}

generateBoard : Html.Html msg
generateBoard =
    let
       collageSize = 380
       board = [
                {- Listed in order -}
                {- Red stables -}
                {x = 1, y = -5, size = 10, aColor = red},
                {x = 0, y = -5, size = 10, aColor = red},
                {x = 0, y = -4, size = 10, aColor = red},
                {x = 0, y = -3, size = 10, aColor = red},
                {x = 0, y = -2, size = 10, aColor = red},
                {x = 0, y = -1, size = 10, aColor = red},
                {x = 0, y = 0, size = 10, aColor = red},



                {x = 0, y = 0, size = 10, aColor = red},
                {x = -1, y = 0, size = 10, aColor = red},
                {x = -2, y = 0, size = 10, aColor = red},
                {x = -3, y = 0, size = 10, aColor = red},
                {x = -4, y = 0, size = 10, aColor = red},
                {x = -5, y = 0, size = 10, aColor = red},
                {x = -6, y = 0, size = 10, aColor = red},

                {- Green stables -}
                {x = -6, y = 1, size = 10, aColor = green},
                {x = -6, y = 2, size = 10, aColor = green},
                {x = -5, y = 2, size = 10, aColor = green},
                {x = -4, y = 2, size = 10, aColor = green},
                {x = -3, y = 2, size = 10, aColor = green},
                {x = -2, y = 2, size = 10, aColor = green},
                {x = -1, y = 2, size = 10, aColor = green},
                {x = 0, y = 2, size = 10, aColor = green},

                {x = 0, y = 2, size = 10, aColor = green},
                {x = 0, y = 3, size = 10, aColor = green},
                {x = 0, y = 4, size = 10, aColor = green},
                {x = 0, y = 5, size = 10, aColor = green},
                {x = 0, y = 6, size = 10, aColor = green},
                {x = 0, y = 7, size = 10, aColor = green},

                {- Blue stables -}
                {x = 1, y = 7, size = 10, aColor = blue},
                {x = 2, y = 7, size = 10, aColor = blue},
                {x = 2, y = 6, size = 10, aColor = blue},
                {x = 2, y = 5, size = 10, aColor = blue},
                {x = 2, y = 4, size = 10, aColor = blue},
                {x = 2, y = 3, size = 10, aColor = blue},
                {x = 2, y = 2, size = 10, aColor = blue},

                {x = 3, y = 2, size = 10, aColor = blue},
                {x = 4, y = 2, size = 10, aColor = blue},
                {x = 5, y = 2, size = 10, aColor = blue},
                {x = 6, y = 2, size = 10, aColor = blue},
                {x = 7, y = 2, size = 10, aColor = blue},
                {x = 7, y = 2, size = 10, aColor = blue},
                {x = 8, y = 2, size = 10, aColor = blue},

                {- yellow stables -}
                {x = 8, y = 1, size = 10, aColor = yellow},
                {x = 8, y = 0, size = 10, aColor = yellow},
                {x = 7, y = 0, size = 10, aColor = yellow},
                {x = 6, y = 0, size = 10, aColor = yellow},
                {x = 5, y = 0, size = 10, aColor = yellow},
                {x = 4, y = 0, size = 10, aColor = yellow},
                {x = 3, y = 0, size = 10, aColor = yellow},
                {x = 2, y = 0, size = 10, aColor = yellow},

                {x = 2, y = 0, size = 10, aColor = yellow},
                {x = 2, y = -1, size = 10, aColor = yellow},
                {x = 2, y = -2, size = 10, aColor = yellow},
                {x = 2, y = -3, size = 10, aColor = yellow},
                {x = 2, y = -4, size = 10, aColor = yellow},
                {x = 2, y = -5, size = 10, aColor = yellow}
                 ]

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