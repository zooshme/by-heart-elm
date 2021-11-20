module Components.Blocks.SiteLogo exposing (siteLogo)

import Components.General.Variables exposing (colors, fontSizes, fontWeights, fonts)
import Css exposing (color, fontFamilies, fontSize, none, property, textDecoration)
import Html.Styled exposing (Attribute, Html, a, text)
import Html.Styled.Attributes exposing (css, href)


siteLogo : List (Attribute msg) -> Html msg
siteLogo attrs =
    a
        (List.append attrs
            [ href "/"
            , css
                [ fontSize fontSizes.medium
                , fontFamilies fonts.heading
                , property "font-weight" (String.fromInt fontWeights.bold)
                , textDecoration none
                , color colors.primary
                ]
            ]
        )
        [ text "by heart"
        ]
