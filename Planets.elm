module Planets (..) where

import Color exposing (..)
import Graphics.Collage exposing (..)


type alias Planet =
  { position : ( Int, Int )
  , ae : Float
  , distance : Float
  , angle : Float
  , form : Form
  }


sun : Planet
sun =
  { position = ( 0, 0 )
  , ae = 0
  , distance = 0
  , angle = 0
  , form = filled yellow <| circle 30
  }


mercury : Planet
mercury =
  { position = ( 40, 40 )
  , ae = 0.39
  , distance = 45
  , angle = 0
  , form = filled green <| circle 2.5
  }


venus : Planet
venus =
  { position = ( 40, 40 )
  , ae = 0.72
  , distance = 65
  , angle = 0
  , form = filled brown <| circle 5
  }


earth : Planet
earth =
  { position = ( 20, 20 )
  , ae = 1
  , distance = 100
  , angle = 0
  , form = filled blue <| circle 10
  }


mars : Planet
mars =
  { position = ( 20, 20 )
  , ae = 1.52
  , distance = 150
  , angle = 0
  , form = filled orange <| circle 6
  }


moon : Planet
moon =
  { position = ( 0, 0 )
  , ae = 0
  , distance = 10
  , angle = 33
  , form = filled black <| circle 2
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
