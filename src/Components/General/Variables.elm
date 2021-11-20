module Components.General.Variables exposing (..)

import Css exposing (Color, Px, hsla, px)


fonts : { heading : List String, body : List String }
fonts =
    { heading =
        [ "Tungsten Rounded A"
        , "Tungsten Rounded B"
        , "sans-serif"
        ]
    , body = []
    }


colors : { primary : Color, secondary : Color }
colors =
    { primary = hsla 0 0 0 100
    , secondary = hsla 0 0 0 100
    }


fontWeights : { bold : Int, normal : Int }
fontWeights =
    { bold = 600
    , normal = 400
    }


fontSizes : { xxsmall : Px, xsmall : Px, small : Px, medium : Px, large : Px, xlarge : Px, xxlarge : Px }
fontSizes =
    { xxsmall = px 10
    , xsmall = px 14
    , small = px 18
    , medium = px 24
    , large = px 32
    , xlarge = px 43
    , xxlarge = px 57
    }


lineHeights : { xxsmall : Px, xsmall : Px, small : Px, medium : Px, large : Px, xlarge : Px, xxlarge : Px }
lineHeights =
    { xxsmall = px 16
    , xsmall = px 20
    , small = px 24
    , medium = px 32
    , large = px 40
    , xlarge = px 48
    , xxlarge = px 64
    }
