module HopExample.App.Update (Action(..), init, update) where

import Effects exposing (Effects)
import Hop.Types exposing (Location)
import HopExample.Router exposing (Route, navigateTo)
import HopExample.App.Model exposing (Model, initialModel)


type Action
  = NoOp ()
  | ApplyRoute ( Route, Location )
  | NavigateTo String


update : Action -> Model -> ( Model, Effects Action )
update action model =
  case action of
    NoOp () ->
      ( model, Effects.none )

    ApplyRoute ( route, location ) ->
      ( { model | route = route, location = location }, Effects.none )

    NavigateTo path ->
      ( model, Effects.map NoOp (navigateTo path) )


init : ( Model, Effects Action )
init =
  ( initialModel, Effects.none )
