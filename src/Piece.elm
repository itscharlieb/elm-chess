module Piece exposing (..)


type Piece
  = Pawn
  | Knight
  | Bishop
  | Rook
  | Queen
  | King


type Color
  = White
  | Black


toLetter : Piece -> Color -> String
toLetter p c =
  case c of
    Black -> String.toLower <| toLetter p White
    White -> case p of
      Pawn -> "P"
      Knight -> "N"
      Bishop -> "B"
      Rook -> "R"
      Queen -> "Q"
      King -> "K"
