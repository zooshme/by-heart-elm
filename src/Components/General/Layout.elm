module Components.General.Layout exposing (container)

import Css exposing (auto, marginLeft, marginRight, maxWidth, px)
import Html.Styled exposing (Attribute, Html, div)
import Svg.Styled.Attributes exposing (css)


container : List (Attribute msg) -> List (Html msg) -> Html msg
container attrs =
    div
        (List.append
            attrs
            [ css
                [ maxWidth (px 1200)
                , marginLeft auto
                , marginRight auto
                ]
            ]
        )
