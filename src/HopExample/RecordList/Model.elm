module HopExample.RecordList.Model (Model, initialModel, findRecordById) where

import HopExample.Record.Model
import HopExample.Record.SeedData exposing (seeds)


type alias Model =
  { records : List HopExample.Record.Model.Model
  }


initialModel : Model
initialModel =
  { records = seeds }


findRecordById : Model -> Int -> Maybe HopExample.Record.Model.Model
findRecordById model id =
  let
    lookup =
      (((==) id) << .id)
  in
    List.head <| List.filter lookup model.records
