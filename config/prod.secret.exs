use Mix.Config

# In this file, we keep production configuration that
# you'll likely want to automate and keep away from
# your version control system.
#
# You should document the content of this
# file or create a script for recreating it, since it's
# kept out of version control and might be hard to recover
# or recreate for your teammates (or yourself later on).
config :collava, CollavaWeb.Endpoint,
  secret_key_base: "bmT0sKsksSbkVx0OxPyqqziZPQDsqZy5F3JNwbrB+b+oTU5CKJAQfAWaHCuKILwe"

# Configure your database
config :collava, Collava.Repo,
  adapter: RethinkDB.Ecto,
  username: "",
  password: "",
  database: "collava_prod"
