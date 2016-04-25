module HopExample.Router (Route(..), router, routerMailbox, navigateTo, linkTo, rootPath, recordPath) where

import Html exposing (Html, Attribute, a)
import Html.Attributes exposing (href)
import Html.Events exposing (onWithOptions, defaultOptions)
import Json.Decode exposing (value)
import Effects
import Hop
import Hop.Matchers exposing (int, match1, match2)
import Hop.Navigate
import Hop.Types exposing (Config, Router, PathMatcher, Location)
import HopExample.Record.Model


type Route
  = HomeRoute
  | RecordRoute Int
  | LoadingRoute
  | NotFoundRoute


navigateTo : String -> Effects.Effects ()
navigateTo =
  Hop.Navigate.navigateTo routerConfig


routerMailbox : Signal.Mailbox String
routerMailbox =
  Signal.mailbox ""


router : Router Route
router =
  Hop.new routerConfig


routerConfig : Config Route
routerConfig =
  { hash = False
  , basePath = "/app"
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
  let
    customLinkAttrs =
      [ href <| "/app" ++ path
      , onClick' routerMailbox.address path
      ]
  in
    a (attrs ++ customLinkAttrs) inner


rootPath : String
rootPath =
  ""


recordPath : HopExample.Record.Model.Model -> String
recordPath record =
  "/records/" ++ (record.id |> toString)


onClick' : Signal.Address a -> a -> Attribute
onClick' addr msg =
  onWithOptions
    "click"
    { defaultOptions | preventDefault = True }
    value
    (\_ -> Signal.message addr msg)
