module OneText exposing (..)

import Html.Styled exposing (Html, h1, text)


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


view : Model -> Html msg
view { title } =
    h1
        []
        [ text title
        ]
