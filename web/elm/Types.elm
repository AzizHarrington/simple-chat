module Types where


type alias Model =
  { messages : Messagelist
  , text : String
  , name : String
  }


type alias Messagelist =
  List ChatMessage


type alias ChatMessage =
  { name : String
  , text : String
  , time : String }


type Action =
  InitializeMessages (List ChatMessage)
  | AddMessage ChatMessage
  | SubmitMessage
  | SetName String
  | SetText String
  | NoOp
