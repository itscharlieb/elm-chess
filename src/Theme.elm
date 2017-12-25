module Theme exposing (..)


type alias Theme =
  { whiteColor : String
  , blackColor : String
  }

standardTheme : Theme
standardTheme =
  { whiteColor = "#eeeed2"
  , blackColor = "#769656"
  }

otherTheme : Theme
otherTheme =
  { whiteColor = "#ffffff"
  , blackColor = "#000000"
  }
