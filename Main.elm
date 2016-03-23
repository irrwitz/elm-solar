module Main (..) where

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
import Planets exposing (..)


type Action
  = NoOp
  | Tick


tick : Signal Float
tick =
  foldp (+) 0 (AnimationFrame.frame)


update : Float -> Model -> Model
update action model =
  case action of
    _ ->
      updateModel model action


updateModel model action =
  { model
    | sun =
        { sun
          | form = move (fromPolar ( 0, degrees 0 )) sun.form
        }
    , mercury =
        { mercury
          | form = move (fromPolar ( mercury.distance, degrees action / 10.5 )) mercury.form
        }
    , venus =
        { venus
          | form = move (fromPolar ( venus.distance, degrees action / 25.89 )) venus.form
        }
    , earth =
        { earth
          | angle = earth.angle + 14
          , form = move (fromPolar ( earth.distance, degrees action / 42 )) earth.form
        }
    , moon =
        { moon
          | angle = moon.angle + 30
          , form = moveMoon action moon
        }
    , mars =
        { mars
          | form = move (fromPolar ( mars.distance, degrees action / 84 )) mars.form
        }
  }


moveMoon action moon =
  moon.form
    |> move (fromPolar ( 130, degrees action / 42 ))
    |> move (fromPolar ( 14, degrees action / 4 ))


main =
  Signal.map view (Signal.foldp update initialModel tick)


view : Model -> Element
view model =
  collage
    500
    500
    [ filled black <| rect 500 500
    , model.sun.form
    , model.mercury.form
    , model.venus.form
    , model.earth.form
    , model.moon.form
    , model.mars.form
    ]
