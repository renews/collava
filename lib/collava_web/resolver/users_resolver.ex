defmodule CollavaWeb.UsersResolver do
  alias Collava.UserSample
  import IEx

  def all_users(_root, _args, _info) do
    users = UserSample.list_users()
    {:ok, users}
  end

  def create_user(_root, args, _info) do
    case UserSample.create_user(args) do
      {:ok, user} ->
        {:ok, user}
      _error ->
        {:error, "could not create user"}
    end
  end

  def get_user(%{id: id}, _info) do
    case UserSample.get_user!(id) do
      nil -> {:error, "User id #{id} not found!"}
      user -> {:ok, user}
    end
  end

  def update(%{id: id, user: user_params}, _info) do
    case get_user(%{id: id}, _info) do
      {:ok, user} -> user |> UserSample.update_user(user_params)
      {:error, _} -> {:error, "user id #{id} not found"}
    end
  end

  def delete(%{id: id}, _info) do
    case get_user(%{id: id}, _info) do
      {:ok, user} -> user |> UserSample.delete_user()
      {:error, _} -> {:error, "user id #{id} not found"}
    end
  end
end