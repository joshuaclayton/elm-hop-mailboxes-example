module HopExample.App.View (view) where

import Html exposing (..)
import Html.Attributes exposing (href)
import HopExample.App.Update exposing (Action)
import HopExample.App.Model exposing (Model)
import HopExample.RecordList.View
import HopExample.Router exposing (Route(..))


view : Signal.Address Action -> Model -> Html
view address model =
  section
    []
    [ pageHeader
    , pageConent address model
    , pageFooter
    ]


pageConent : Signal.Address Action -> Model -> Html
pageConent address model =
  case model.route of
    HomeRoute ->
      HopExample.RecordList.View.view model.recordList

    LoadingRoute ->
      h3 [] [ text "Loading..." ]

    NotFoundRoute ->
      h3 [] [ text "Page Not Found" ]

    RecordRoute id ->
      h3 [] [ text "Record Page" ]


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
