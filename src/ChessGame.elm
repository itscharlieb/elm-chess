import Html exposing (..)
import Html.Events exposing (..)

import ChessBoardView exposing (..)
import ChessMsg exposing (..)
import Theme exposing (..)


main : Program Never Model ChessMsg
main =
  Html.program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }



-- MODEL


type alias Model =
  { theme : Theme
  }

init : (Model, Cmd ChessMsg)
init =
  (Model standardTheme, Cmd.none)



-- UPDATE


update : ChessMsg -> Model -> (Model, Cmd ChessMsg)
update msg model =
  case msg of
    SetTheme theme -> (Model theme, Cmd.none)



-- SUBSCRIPTIONS


subscriptions : Model -> Sub ChessMsg
subscriptions model =
  Sub.none



-- VIEW


view : Model -> Html ChessMsg
view model =
  div []
    [ chessBoard model.theme
    , button [ onClick <| SetTheme standardTheme ] [ Html.text "Standard Theme" ]
    , button [ onClick <| SetTheme otherTheme ] [ Html.text "Other Theme"]
    ]
