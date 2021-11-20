module Components.Typography exposing (heading)

import Components.Variables exposing (colors, fontSizes, fontWeights, lineHeights)
import Css as C exposing (..)
import Dict exposing (Dict)
import Html.Styled as H exposing (..)
import Html.Styled.Attributes as A exposing (..)



-- Settings --


headingMarkupSettings : Dict Int (List (Attribute msg) -> List (Html msg) -> Html msg)
headingMarkupSettings =
    Dict.fromList
        [ ( 1, h1 )
        , ( 2, h2 )
        , ( 3, h3 )
        , ( 4, h4 )
        , ( 5, h5 )
        , ( 6, h6 )
        ]


headingColorSettings : Dict Int Color
headingColorSettings =
    Dict.fromList
        [ ( 1, colors.primary )
        , ( 2, colors.primary )
        , ( 3, colors.primary )
        , ( 4, colors.secondary )
        , ( 5, colors.secondary )
        , ( 6, colors.secondary )
        ]


headingFontWeightSettings : Dict Int Int
headingFontWeightSettings =
    Dict.fromList
        [ ( 1, fontWeights.bold )
        , ( 2, fontWeights.bold )
        , ( 3, fontWeights.bold )
        , ( 4, fontWeights.bold )
        , ( 5, fontWeights.bold )
        , ( 6, fontWeights.bold )
        ]


headingFontSizeSettings : Dict Int Px
headingFontSizeSettings =
    Dict.fromList
        [ ( 1, fontSizes.xxlarge )
        , ( 2, fontSizes.xlarge )
        , ( 3, fontSizes.large )
        , ( 4, fontSizes.medium )
        , ( 5, fontSizes.small )
        , ( 6, fontSizes.xsmall )
        ]


headingLineHeightSettings : Dict Int Px
headingLineHeightSettings =
    Dict.fromList
        [ ( 1, lineHeights.xxlarge )
        , ( 2, lineHeights.xlarge )
        , ( 3, lineHeights.large )
        , ( 4, lineHeights.medium )
        , ( 5, lineHeights.small )
        , ( 6, lineHeights.xsmall )
        ]



-- Getters --


getSetting : comparable -> Dict comparable v -> Maybe v
getSetting level settings =
    Dict.get level settings


getMarkupSetting : Int -> List (Attribute msg) -> List (Html msg) -> Html msg
getMarkupSetting level =
    Maybe.withDefault p (getSetting level headingMarkupSettings)


getColorSetting : Int -> Color
getColorSetting level =
    Maybe.withDefault colors.secondary (getSetting level headingColorSettings)


getFontWeightSetting : Int -> Int
getFontWeightSetting level =
    Maybe.withDefault fontWeights.normal (getSetting level headingFontWeightSettings)


getFontSizeSetting : Int -> Px
getFontSizeSetting level =
    Maybe.withDefault fontSizes.medium (getSetting level headingFontSizeSettings)


getLineHeightSetting : Int -> Px
getLineHeightSetting level =
    Maybe.withDefault lineHeights.medium (getSetting level headingLineHeightSettings)


headingFontFamilies : Style
headingFontFamilies =
    fontFamilies
        [ "Tungsten Rounded A"
        , "Tungsten Rounded B"
        , "sans-serif"
        ]


heading : Int -> List (Attribute msg) -> (List (Html msg) -> Html msg)
heading level attrs =
    getMarkupSetting
        level
        (List.append
            attrs
            [ css
                [ headingFontFamilies
                , fontSize (getFontSizeSetting level)
                , C.property "font-weight" (String.fromInt (getFontWeightSetting level))
                , lineHeight (getLineHeightSetting level)
                , color (getColorSetting level)
                ]
            ]
        )
