module Components.Blocks.SiteHeader exposing (siteHeader)

import Components.Blocks.SiteLogo exposing (siteLogo)
import Components.Blocks.SiteNavigation exposing (siteNavigation)
import Components.General.Layout exposing (container)
import Css exposing (padding2, px)
import Html.Styled exposing (Attribute, Html, header)
import Html.Styled.Attributes exposing (css)


siteHeader : List (Attribute msg) -> Html msg
siteHeader attrs =
    header
        (List.append attrs
            [ css [ padding2 (px 20) (px 0) ]
            ]
        )
        [ container []
            [ siteLogo []
            , siteNavigation []
            ]
        ]
