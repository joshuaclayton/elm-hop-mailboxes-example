module HopExample.Router (Route(..), router, linkTo, rootPath, recordPath) where

import Html exposing (Html, Attribute, a)
import Html.Attributes exposing (href)
import Hop
import Hop.Matchers exposing (int, match1, match2)
import Hop.Navigate exposing (navigateTo)
import Hop.Types exposing (Config, Router, PathMatcher, Location)
import HopExample.Record.Model


type Route
  = HomeRoute
  | RecordRoute Int
  | LoadingRoute
  | NotFoundRoute


router : Router Route
router =
  Hop.new routerConfig


routerConfig : Config Route
routerConfig =
  { hash = False
  , basePath = ""
  , matchers = matchers
  , notFound = NotFoundRoute
  }


matchers : List (PathMatcher Route)
matchers =
  [ match1 HomeRoute ""
  , match2 RecordRoute "/records/" int
  ]


linkTo : String -> List Attribute -> List Html -> Html
linkTo path attrs inner =
  a ((href path) :: attrs) inner


rootPath : String
rootPath =
  "/"


recordPath : HopExample.Record.Model.Model -> String
recordPath record =
  "/records/" ++ (record.id |> toString)
