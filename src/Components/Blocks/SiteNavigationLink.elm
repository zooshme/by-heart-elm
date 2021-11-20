module Components.Blocks.SiteNavigationLink exposing (siteNavigationLink)

import Html.Styled exposing (Attribute, Html, a)
import Html.Styled.Attributes exposing (css)


siteNavigationLink : List (Attribute msg) -> List (Html msg) -> Html msg
siteNavigationLink attrs =
    a
        (List.append attrs
            [ css []
            ]
        )
