module Components.Blocks.SiteNavigation exposing (siteNavigation)

import Components.Blocks.SiteNavigationLink exposing (siteNavigationLink)
import Html.Styled exposing (Attribute, Html, nav, text)
import Html.Styled.Attributes exposing (href)


siteNavigation : List (Attribute msg) -> Html msg
siteNavigation attrs =
    nav
        attrs
        [ siteNavigationLink [ href "/" ] [ text "Home" ]
        , siteNavigationLink [ href "/texts" ] [ text "All texts" ]
        , siteNavigationLink [ href "/texts/id" ] [ text "One text" ]
        , siteNavigationLink [ href "/texts/id" ] [ text "Something else" ]
        ]
