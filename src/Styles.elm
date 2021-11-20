module Styles exposing (..)

import Css as Css exposing (Style, fontFamilies)

headingFont : Style
headingFont =
    Css.batch
        [ fontFamilies
            [ "Tungsten Rounded A"
            , "Tungsten Rounded B"
            , "sans-serif"
            ]
        ]


bodyFont : Style
bodyFont =
    Css.batch
        [ fontFamilies
            [ "Operator Mono SSm A"
            , "Operator Mono SSm B"
            , "sans-serif"
            ]
        ]
