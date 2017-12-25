module Position exposing (..)

import Dict exposing (..)
import Piece exposing (..)


type alias Position =
  { row : Int
  , rank : Int
  }


positions : List Position
positions =
  let
    r = List.range 0 7
  in
    List.concat (
      List.map
        (\x -> List.map (\y -> Position x y) r)
        r
    )


toKey : Position -> (Int, Int)
toKey {row, rank} = (row, rank)


startingPositions : (Dict.Dict (Int, Int) (Piece, Color))
startingPositions =
  Dict.fromList
    [
    -- White
      ((0, 0), (Rook, White))
    , ((1, 0), (Knight, White))
    , ((2, 0), (Bishop, White))
    , ((3, 0), (Queen, White))
    , ((4, 0), (King, White))
    , ((5, 0), (Bishop, White))
    , ((6, 0), (Knight, White))
    , ((7, 0), (Rook, White))
    , ((0, 1), (Pawn, White))
    , ((1, 1), (Pawn, White))
    , ((2, 1), (Pawn, White))
    , ((3, 1), (Pawn, White))
    , ((4, 1), (Pawn, White))
    , ((5, 1), (Pawn, White))
    , ((6, 1), (Pawn, White))
    , ((7, 1), (Pawn, White))

    -- Black
    , ((0, 7), (Rook, Black))
    , ((1, 7), (Knight, Black))
    , ((2, 7), (Bishop, Black))
    , ((3, 7), (Queen, Black))
    , ((4, 7), (King, Black))
    , ((5, 7), (Bishop, Black))
    , ((6, 7), (Knight, Black))
    , ((7, 7), (Rook, Black))
    , ((0, 6), (Pawn, Black))
    , ((1, 6), (Pawn, Black))
    , ((2, 6), (Pawn, Black))
    , ((3, 6), (Pawn, Black))
    , ((4, 6), (Pawn, Black))
    , ((5, 6), (Pawn, Black))
    , ((6, 6), (Pawn, Black))
    , ((7, 6), (Pawn, Black))
    ]
