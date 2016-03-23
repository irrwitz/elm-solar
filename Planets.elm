module Planets (..) where

import Color exposing (..)
import Graphics.Collage exposing (..)


type alias Planet =
  { position : ( Int, Int )
  , ae : Float
  , distance : Float
  , diameter: Float
  , angle : Float
  , form : Form
  }


sun : Planet
sun =
  { position = ( 0, 0 )
  , ae = 0
  , distance = 0
  , diameter = 1392684
  , angle = 0
  , form = filled yellow <| circle 30
  }


mercury : Planet
mercury =
  { position = ( 40, 40 )
  , ae = 0.39
  , distance = 50
  , diameter = 4880
  , angle = 0
  , form = filled green <| circle 3.2
  }


venus : Planet
venus =
  { position = ( 40, 40 )
  , ae = 0.72
  , distance = 94.3
  , diameter = 12100
  , angle = 0
  , form = filled brown <| circle 9.4
  }


earth : Planet
earth =
  { position = ( 20, 20 )
  , ae = 1
  , distance = 130
  , diameter = 12756
  , angle = 0
  , form = filled blue <| circle 10
  }


mars : Planet
mars =
  { position = ( 20, 20 )
  , ae = 1.52
  , distance = 200
  , diameter = 6794
  , angle = 0
  , form = filled orange <| circle 4.8
  }


moon : Planet
moon =
  { position = ( 0, 0 )
  , ae = 0
  , distance = 10
  , diameter = 3474
  , angle = 33
  , form = filled white <| circle 2
  }


type alias Model =
  { sun : Planet
  , mercury : Planet
  , venus : Planet
  , earth : Planet
  , moon : Planet
  , mars : Planet
  }


initialModel =
  { sun = sun
  , mercury = mercury
  , venus = venus
  , earth = earth
  , moon = moon
  , mars = mars
  }
