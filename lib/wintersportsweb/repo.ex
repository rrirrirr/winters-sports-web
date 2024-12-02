defmodule Wintersportsweb.Repo do
  use Ecto.Repo,
    otp_app: :wintersportsweb,
    adapter: Ecto.Adapters.Postgres
end
