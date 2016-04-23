module HopExample.App.View (view) where

import Html exposing (..)
import Html.Attributes exposing (href)
import HopExample.App.Update exposing (Action)
import HopExample.App.Model exposing (Model)
import HopExample.RecordList.View


view : Signal.Address Action -> Model -> Html
view address model =
  section
    []
    [ pageHeader
    , HopExample.RecordList.View.view model.recordList
    , pageFooter
    ]


pageHeader : Html
pageHeader =
  header
    []
    [ h1 [] [ text "Hop + Mailboxes Example App" ] ]


pageFooter : Html
pageFooter =
  footer
    []
    [ p
        []
        [ text "Copyright 2016 Josh Clayton. View this application on "
        , a [ href "https://github.com/joshuaclayton/elm-hop-mailboxes-example" ] [ text "GitHub" ]
        , text "."
        ]
    ]
