module HopExample.Record.View (view) where

import Html exposing (..)
import HopExample.Record.Model exposing (Model)


view : Model -> Html
view model =
  section
    []
    [ h2 [] [ text <| model.record ++ " by " ++ model.artist ]
    , p [] [ text <| "Released on " ++ (model.yearReleased |> toString) ]
    ]
