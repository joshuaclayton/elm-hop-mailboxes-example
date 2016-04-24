module HopExample.App.View (view) where

import Html exposing (..)
import Html.Attributes exposing (href)
import HopExample.App.Update exposing (Action)
import HopExample.App.Model exposing (Model)
import HopExample.RecordList.Model exposing (findRecordById)
import HopExample.RecordList.View
import HopExample.Record.View
import HopExample.Router exposing (Route(..), rootPath)


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
      notFound

    RecordRoute id ->
      let
        recordResult =
          HopExample.RecordList.Model.findRecordById model.recordList id
      in
        case recordResult of
          Just model' ->
            HopExample.Record.View.view identity model'

          Nothing ->
            notFound


notFound : Html
notFound =
  h3 [] [ text "Page Not Found" ]


pageHeader : Html
pageHeader =
  header
    []
    [ h1
        []
        [ a [ href rootPath ] [ text "Hop + Mailboxes Example App" ]
        ]
    ]


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
