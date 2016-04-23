module Main (..) where

import Effects exposing (Never)
import Task exposing (Task)
import StartApp
import HopExample.App.Update exposing (Action, init, update)
import HopExample.App.View exposing (view)


app =
  StartApp.start
    { init = init
    , update = update
    , view = view
    , inputs = inputs
    }


main =
  app.html


inputs : List (Signal Action)
inputs =
  []


port tasks : Signal (Task Never ())
port tasks =
  app.tasks
