module HopExample.App.Update (Action(..), init, update) where

import Effects exposing (Effects)
import HopExample.App.Model exposing (Model, initialModel)


type Action
  = NoOp ()


update : Action -> Model -> ( Model, Effects Action )
update action model =
  ( model, Effects.none )


init : ( Model, Effects Action )
init =
  ( initialModel, Effects.none )
