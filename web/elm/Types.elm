module Types where


type alias Model =
  { messages : Messagelist
  , text : String
  , name : String
  }


type alias Messagelist =
  List Chatmessage


type alias Chatmessage =
  { name : String
  , text : String
  , time : String }


type Action =
  InitializeMessages (List Chatmessage)
  -- | AddMessage
  | SubmitMessage
  | SetName String
  | SetText String
  | NoOp
