defmodule Collava.Sample.User do
  use Ecto.Schema
  import Ecto.Changeset
  use Coherence.Schema

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "users" do
    field(:age, :integer)
    field(:name, :string)
    field(:email, :string)
    coherence_schema()

    timestamps()
  end

  @doc false
  def changeset(model, params \\ %{}) do
    model
    |> cast(params, [:name, :email] ++ coherence_fields)
    |> validate_required([:name, :email])
    |> validate_format(:email, ~r/@/)
    |> validate_coherence(params)
  end

  def changeset(model, params, :password) do
    model
    |> cast(
      params,
      ~w(password password_confirmation reset_password_token reset_password_sent_at)
    )
    |> validate_coherence_password_reset(params)
  end
end
