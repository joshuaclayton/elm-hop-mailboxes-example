module HopExample.Record.SeedData (seeds) where

import HopExample.Record.Model exposing (Model)


seeds : List Model
seeds =
  [ revolver
  , tommy
  , ii
  ]


revolver : Model
revolver =
  { id = 1
  , artist = "The Beatles"
  , record = "Revolver"
  , yearReleased = 1966
  }


tommy : Model
tommy =
  { id = 2
  , artist = "The Who"
  , record = "Tommy"
  , yearReleased = 1969
  }


ii : Model
ii =
  { id = 3
  , artist = "Led Zeppelin"
  , record = "II"
  , yearReleased = 1969
  }
