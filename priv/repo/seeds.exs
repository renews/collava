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

alias Collava.System.User
alias Collava.Repo

%User{name: "Thales", age: 100} |> Repo.insert!
%User{name: "Rene", age: 200} |> Repo.insert!