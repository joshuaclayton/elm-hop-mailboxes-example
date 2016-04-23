module HopExample.App.View (view) where

import Html exposing (..)
import HopExample.App.Update exposing (Action)
import HopExample.App.Model exposing (Model)
import HopExample.RecordList.View


view : Signal.Address Action -> Model -> Html
view address model =
  div
    []
    [ HopExample.RecordList.View.view model.recordList ]
