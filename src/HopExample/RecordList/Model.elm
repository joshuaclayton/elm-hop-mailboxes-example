module HopExample.RecordList.Model (Model, initialModel) where

import HopExample.Record.Model
import HopExample.Record.SeedData exposing (seeds)


type alias Model =
  { records : List HopExample.Record.Model.Model
  }


initialModel : Model
initialModel =
  { records = seeds }
