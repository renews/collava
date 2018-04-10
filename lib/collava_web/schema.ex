defmodule CollavaWeb.Schema do
  use Absinthe.Schema

  alias CollavaWeb.UsersResolver

  object :user do
    field :id, non_null(:string)
    field :name, non_null(:string)
    field :age, non_null(:integer)
  end

  query do
    field :all_users, non_null(list_of(non_null(:user))) do
      resolve &UsersResolver.all_users/3
    end

    field :get_user, type: :user do
      arg(:id, non_null(:string))
      resolve &UsersResolver.get_user/2
    end
  end

  mutation do
    field :create_user, :user do
      arg :name, non_null(:string)
      arg :age, non_null(:integer)
  
      resolve &UsersResolver.create_user/3
    end

    field :update_user, type: :user do
      arg(:id, non_null(:string))
      arg(:user, :update_user_params)
   
      resolve &UsersResolver.update/2
    end

    field :delete_user, type: :user do
      arg :id, non_null(:string)
   
      resolve &UsersResolver.delete/2
    end
  end

  input_object :update_user_params do
    field(:name, :string)
    field(:age, :integer)
   end
end