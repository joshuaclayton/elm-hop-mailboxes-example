module HopExample.Router (Route(..), router) where

import Hop
import Hop.Matchers exposing (int, match1, match2)
import Hop.Navigate exposing (navigateTo)
import Hop.Types exposing (Config, Router, PathMatcher, Location)


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
