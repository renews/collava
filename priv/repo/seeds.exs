# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Collava.Repo.insert!(%Collava.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Collava.Sample.User
alias Collava.Repo

# Collava.Repo.delete_all()

Collava.Sample.User.changeset(%Collava.Sample.User{}, %{
  name: "Test User",
  email: "testuser@example.com",
  password: "secret",
  password_confirmation: "secret"
})
|> Collava.Repo.insert!()
