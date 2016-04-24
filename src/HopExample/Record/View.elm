module HopExample.Record.View (view) where

import Html exposing (..)
import HopExample.Record.Model exposing (Model)


view : (Html -> Html) -> Model -> Html
view f model =
  section
    []
    [ f <| h2 [] [ text <| model.record ++ " by " ++ model.artist ]
    , p [] [ text <| "Released on " ++ (model.yearReleased |> toString) ]
    ]
