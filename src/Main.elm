module Main (..) where

import Effects exposing (Never)
import Task exposing (Task)
import StartApp
import HopExample.App.Update exposing (Action(ApplyRoute, NavigateTo), init, update)
import HopExample.App.View exposing (view)
import HopExample.Router exposing (router, routerMailbox)


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
  [ hopRouteSignal, navigations ]


hopRouteSignal : Signal Action
hopRouteSignal =
  Signal.map ApplyRoute router.signal


navigations : Signal Action
navigations =
  Signal.map NavigateTo routerMailbox.signal


port routeRunTask : Task () ()
port routeRunTask =
  router.run


port tasks : Signal (Task Never ())
port tasks =
  app.tasks
