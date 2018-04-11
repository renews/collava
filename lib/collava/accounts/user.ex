defmodule Collava.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  # You must define your primary-key and foreign-key types as :binary_id
  @primary_key {:id, :binary_id, autogenerate: false}
  @foreign_key_type :binary_id

  schema "users" do
    field(:name, :string)

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
