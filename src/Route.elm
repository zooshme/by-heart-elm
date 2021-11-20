module Route exposing (..)

import Home
import Html as H
import Html.Styled as S
import OneText
import Router exposing (mapRoute)
import TextList
import Url exposing (Url)
import Url.Parser as Parser exposing ((</>), Parser)


type Route
    = Home Home.Model
    | TextList
    | OneText OneText.Model


type Msg
    = HomeMsg Home.Model Home.Msg
    | OneTextMsg OneText.Model OneText.Msg


homeParser : Parser a a
homeParser =
    Parser.top


textListParser : Parser a a
textListParser =
    Parser.s "texts"


oneTextParser : Parser (String -> a) a
oneTextParser =
    Parser.s "texts" </> Parser.string


parser : Parser (Route -> a) a
parser =
    Parser.oneOf
        [ mapRoute homeParser <| Home <| Home.init
        , mapRoute textListParser TextList
        , mapRoute oneTextParser (\s -> OneText (OneText.init s))
        ]


update : Msg -> ( Route, Cmd Msg )
update message =
    case message of
        HomeMsg model msg ->
            Home.update msg model |> Router.mapUpdate Home HomeMsg

        OneTextMsg model msg ->
            OneText.update msg model |> Router.mapUpdate OneText OneTextMsg


subscriptions : Route -> Sub Msg
subscriptions route =
    case route of
        Home _ ->
            Sub.none

        TextList ->
            Sub.none

        OneText _ ->
            Sub.none


view : Route -> List (S.Html Msg)
view route =
    case route of
        Home model ->
            Home.view model

        TextList ->
            TextList.view

        OneText model ->
            OneText.view model


title : Route -> Maybe String
title route =
    case route of
        Home model ->
            Nothing

        TextList ->
            Just "Text List"

        OneText model ->
            Just "One Text"


notFound : Url -> List (H.Html msg)
notFound url =
    [ H.h1
        []
        [ H.text "Page not found"
        ]
    ]
