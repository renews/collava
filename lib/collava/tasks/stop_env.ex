defmodule Mix.Tasks.Env.Stop do
  use Mix.Task

  @shortdoc "Stop collava dev environment."
  def run(_) do
    Mix.Shell.cmd("docker-compose down --remove-orphans", fn output -> IO.write(output) end)
  end
end
