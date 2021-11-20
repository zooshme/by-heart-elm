module OneText exposing (..)

import Html.Styled as H exposing (Html)


type alias Model =
    { title : String
    , textId : String
    }


init : String -> Model
init textId =
    Model "" textId


type Msg
    = TextMsg


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        TextMsg ->
            ( model, Cmd.none )


view : Model  -> List (Html msg)
view { title } =
    [ H.h1
        []
        [ H.text title
        ]
    ]
