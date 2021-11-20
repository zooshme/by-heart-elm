module Home exposing (..)

import Components.Typography exposing (heading)
import Html.Styled as H exposing (Html)


type alias Model =
    { title : String
    }


init : Model
init =
    { title = ""
    }


type Msg
    = HomeMsg


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        HomeMsg ->
            ( model, Cmd.none )


view : Model -> List (Html msg)
view model =
    [ (heading 1 []) [(H.text "Hi there")]
    ]
