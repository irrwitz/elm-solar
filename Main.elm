import AnimationFrame
import Color exposing (..)
import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)
import Html exposing (text)
import Time exposing (..)
import Text exposing (..)
import Signal exposing (..)
import Debug exposing (..)
import Signal


type Action = NoOp | Tick

type alias Planet =
  { position : (Int, Int)
  , ae : Float
  , distance : Float
  , angle : Float
  , form : Form
  }

sun : Planet
sun =
  { position = (0,0)
  , ae = 0
  , distance = 0
  , angle = 0
  , form = filled yellow <| circle 30
  }


mercury : Planet
mercury =
  { position = (40,40)
  , ae = 0.39
  , distance = 45
  , angle = 0
  , form = filled green <| circle 2.5
  }


venus : Planet
venus =
  { position = (40,40)
  , ae = 0.72
  , distance = 65
  , angle = 0
  , form = filled brown <| circle 5
  }

earth : Planet
earth =
  {  position = (20, 20)
  , ae = 1
  , distance = 100
  , angle = 0
  , form = filled blue <| circle 10
  }

mars : Planet
mars =
  {  position = (20, 20)
  , ae = 1.52
  , distance = 150
  , angle = 0
  , form = filled orange <| circle 6
  }

moon : Planet
moon =
  {  position = (0,0)
  , ae = 0
  , distance = 10
  ,  angle = 33
  ,  form = filled black <| circle 2
  }


type alias Model =
  { sun: Planet
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


tick : Signal Float
tick = foldp (+) 0 (AnimationFrame.frame)


update : Float -> Model -> Model
update action model =
  case action of
    _ -> updateModel model action


updateModel model action =
     {  model
          | sun = {
                    sun |
                       form = move (fromPolar (0, degrees 0)) sun.form}
          , mercury = {
                    mercury |
                       form = move (fromPolar (mercury.distance, degrees action/14)) mercury.form}
         , venus = {
                    venus |
                       form = move (fromPolar (venus.distance, degrees action/10)) venus.form}
          , earth = {
                    earth |
                      angle = earth.angle + 14,
                      form = move (fromPolar (earth.distance, degrees action/42)) earth.form
                    }
         , moon = {
                    moon |
                     angle = moon.angle + 30,  form = moveMoon action moon }
        , mars = {
                    mars |
                     form = move (fromPolar (mars.distance, degrees action/40)) mars.form}
        }


moveMoon action moon  =
  moon.form
    |> move (fromPolar (100, degrees action/42))
    |> move (fromPolar (15, degrees action/4))

main =
  Signal.map view (Signal.foldp update initialModel tick)


view : Model -> Element
view model =
     collage 400 400
      [ model.sun.form
      , model.mercury.form
      , model.venus.form
      , model.earth.form
      , model.moon.form
      , model.mars.form
      ]