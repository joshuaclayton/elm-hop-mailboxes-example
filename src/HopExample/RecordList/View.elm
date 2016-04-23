module HopExample.RecordList.View (view) where

import Html exposing (..)
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
  li
    []
    [ HopExample.Record.View.view record ]
