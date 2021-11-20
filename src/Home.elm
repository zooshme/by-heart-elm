module Home exposing (..)

import Components.General.Typography exposing (heading)
import Html.Styled exposing (Html, text)


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


view : Model -> Html msg
view model =
    heading 1 [] [ text "Hi there" ]
