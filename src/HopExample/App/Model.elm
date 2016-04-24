module HopExample.App.Model (Model, initialModel) where

import Hop.Types exposing (Location, newLocation)
import HopExample.Router exposing (Route(LoadingRoute))
import HopExample.RecordList.Model as RLM


type alias Model =
  { recordList : RLM.Model
  , route : Route
  , location : Location
  }


initialModel : Model
initialModel =
  { recordList = RLM.initialModel
  , route = LoadingRoute
  , location = newLocation
  }
