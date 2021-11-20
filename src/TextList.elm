module TextList exposing (..)

import Html.Styled as H exposing (Html)


view : List (Html msg)
view =
    [ H.h1
        []
        [ H.text "Text list"
        ]
    ]
