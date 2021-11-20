module Main exposing (..)

import Browser exposing (Document)
import Browser.Navigation exposing (Key)
import Components.Blocks.SiteHeader exposing (siteHeader)
import Css exposing (..)
import Html as H
import Html.Styled as S exposing (..)
import Html.Styled.Attributes as A exposing (..)
import Route exposing (Route)
import Router exposing (Config, Router)
import Url exposing (Url)



---- MODEL ----


type alias Model =
    { router : Router Route }


type Msg
    = Router (Router.Msg Route.Msg)
    | UrlChanged Url


config : Config Msg Route Route.Msg
config =
    { parser = Route.parser
    , update = Route.update
    , view = Route.view
    , message = Router
    , subscriptions = Route.subscriptions
    , notFound = Route.notFound
    , onUrlChanged = Just UrlChanged
    , routeTitle = Route.title
    }


init : () -> Url -> Key -> ( Model, Cmd Msg )
init _ url key =
    let
        ( router, cmd ) =
            Router.init config url key
    in
    ( Model router, cmd )



---- UPDATE ----


update : Msg -> Model -> ( Model, Cmd Msg )
update message ({ router } as model) =
    case message of
        Router msg ->
            let
                ( newRouter, cmd ) =
                    Router.update config msg router
            in
            ( { model | router = newRouter }, cmd )

        UrlChanged _ ->
            ( model, Cmd.none )



---- VIEW ----


routerView : Router Route -> H.Html Msg
routerView router =
    case List.head (Router.view config router) of
        Just html ->
            html

        Nothing ->
            H.div [] []


logoView : S.Html Msg
logoView =
    a
        [ href "/"
        ]
        [ text "By Heart"
        ]


body : Router Route -> S.Html Msg
body router =
    div []
        [ siteHeader []
        , main_ [] [ S.fromUnstyled (routerView router) ]
        ]


view : Model -> Document Msg
view { router } =
    { title = Router.title router "My app"
    , body = [ toUnstyled (body router) ]
    }


subscriptions : Model -> Sub Msg
subscriptions { router } =
    Router.subscriptions config router



---- PROGRAM ----


main : Program () Model Msg
main =
    Browser.application
        { init = init
        , update = update
        , view = view
        , subscriptions = always Sub.none
        , onUrlChange = Router.onUrlChange config
        , onUrlRequest = Router.onUrlRequest config
        }
