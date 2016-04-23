module HopExample.App.Model (Model, initialModel) where

import HopExample.RecordList.Model as RLM


type alias Model =
  { recordList : RLM.Model
  }


initialModel : Model
initialModel =
  { recordList = RLM.initialModel }
