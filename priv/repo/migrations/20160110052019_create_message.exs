defmodule SimpleChat.Repo.Migrations.CreateMessage do
  use Ecto.Migration

  def change do
    create table(:messages) do
      add :user_name, :string
      add :text, :string

      timestamps
    end

  end
end
