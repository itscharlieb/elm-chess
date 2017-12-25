module ChessBoardView exposing (..)


import Html exposing (..)
import Svg exposing (..)
import Svg.Attributes exposing (..)
import Dict
import ChessMsg exposing (..)
import Piece exposing (..)
import Theme exposing (..)
import Position exposing (..)


chessBoard : Theme -> (Html ChessMsg)
chessBoard theme =
  svg [ viewBox "0 0 200 200", width "400px" ]
    ( List.map (\p ->
        let maybePiece = Dict.get (toKey p) startingPositions
        in chessSquare p maybePiece theme)
       positions
    )


chessSquare : Position -> Maybe (Piece, Color) -> Theme -> Html ChessMsg
chessSquare position maybePiece theme =
  svg []
    [ rect
      [ x (toString (position.row * 25))
      , y (toString (position.rank * 25))
      , width "25", height "25"
      , fill (colorOf position theme)
      ]
      []
    , Svg.text_
        [ x <| toString <| position.row * 25
        , y <| toString <| (position.rank + 1) * 25
        , fill "blue"
        , fontSize "8"
        ]
        [ Svg.text <| case maybePiece of
            Nothing -> ""
            Just (piece, c) -> toLetter piece c
        ]
    ]


colorOf : Position -> Theme -> String
colorOf {row, rank} theme =
  let
    isEven i = i % 2 == 0
  in
    if (isEven row) == (isEven rank)
      then theme.whiteColor
      else theme.blackColor
