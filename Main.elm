import AnimationFrame
import Signal
import Color exposing (..)
import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)
import Html exposing (text)
import Time exposing (..)
import Debug exposing (..)
import Text exposing (..)


a : Signal Time
a = fps 60

t : Signal Float
t = AnimationFrame.frame



main =
  Signal.map view t


view : Float -> Element
view time =
   let
     --angle = degrees (90 - 6 * time)
     speed =  1 / (60.0 * 24.0 * 2 * time)
     angle = time * 1
   in
     collage 400 400
      [ outlined (solid black) (circle 20)
      , move (fromPolar (20, 0)) (filled ( green) (circle 5))
      , move (fromPolar (20, 10)) (filled ( blue) (circle 5))
      , move (fromPolar (20, 20)) (filled ( red) (circle 5))
      , move (fromPolar (20, 30)) (filled ( yellow) (circle 5))
      , move (fromPolar (20, 40)) (filled ( grey) (circle 5))
      , move (fromPolar (20, 50)) (filled ( black) (circle 5))
      , move (fromPolar (20, 90)) (filled ( orange) (circle 5))

      --, Graphics.Collage.text  (Text.fromString  (toString (time)))
      ]
    --degrees (90 - 6 * inSeconds time)
{-- }
main =
  Signal.map Graphics.Element.show (Signal.foldp (+) 0 AnimationFrame.frame)

  --}