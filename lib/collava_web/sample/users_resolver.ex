defmodule CollavaWeb.Sample.UsersResolver do
  alias Collava.Sample.Users

  def all_users(_root, _args, _info) do
    users = Users.list_users()
    {:ok, users}
  end

  def create_user(_root, args, _info) do
    case Users.create_user(args) do
      {:ok, user} ->
        {:ok, user}

      _error ->
        {:error, "could not create user"}
    end
  end

  def get_user(%{id: id}, _info) do
    case Users.get_user!(id) do
      nil -> {:error, "User id #{id} not found!"}
      user -> {:ok, user}
    end
  end

  def update(%{id: id, user: user_params}, _info) do
    case get_user(%{id: id}, _info) do
      {:ok, user} -> user |> Users.update_user(user_params)
      {:error, _} -> {:error, "user id #{id} not found"}
    end
  end

  def delete(%{id: id}, _info) do
    case get_user(%{id: id}, _info) do
      {:ok, user} -> user |> Users.delete_user()
      {:error, _} -> {:error, "user id #{id} not found"}
    end
  end
end
