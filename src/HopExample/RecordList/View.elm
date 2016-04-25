module HopExample.RecordList.View (view) where

import Html exposing (..)
import Html.Attributes exposing (href)
import HopExample.Router exposing (recordPath)
import HopExample.Record.View
import HopExample.Record.Model
import HopExample.RecordList.Model exposing (Model)


view : Model -> Html
view model =
  ul
    []
    (List.map renderRecord model.records)


renderRecord : HopExample.Record.Model.Model -> Html
renderRecord record =
  let
    linkToRecord =
      (\html -> a [ href <| recordPath record ] [ html ])
  in
    li
      []
      [ HopExample.Record.View.view linkToRecord record ]
