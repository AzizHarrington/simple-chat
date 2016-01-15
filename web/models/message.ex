defmodule SimpleChat.Message do
  use SimpleChat.Web, :model

  schema "messages" do
    field :user_name, :string
    field :text, :string

    timestamps
  end

  @required_fields ~w(user_name text)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end

  defimpl Poison.Encoder, for: SimpleChat.Message do
    def encode(model, opts) do
      %{name: model.user_name,
        text: model.text,
        time: formatted_time(model.inserted_at)}
      |> Poison.Encoder.encode(opts)
    end

    defp formatted_time(date) do
      {:ok, date} = Ecto.DateTime.dump(date)
      Timex.Date.from(date)
      |> Timex.DateFormat.format!( "%B %e, %Y", :strftime)
    end
  end
end
