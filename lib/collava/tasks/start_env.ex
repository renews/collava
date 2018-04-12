defmodule Mix.Tasks.Env.Start do
  use Mix.Task

  @shortdoc "Start collava dev environment detached."
  def run(_) do
    Mix.Shell.cmd("docker-compose down && \
    docker-compose build --pull --no-cache && \
    docker-compose \
      -f docker-compose.yml \
    up -d --remove-orphans", fn output -> IO.write(output) end)
  end
end
