defmodule IpMajorProject.Repo do
  use Ecto.Repo,
    otp_app: :ip_major_project,
    adapter: Ecto.Adapters.Postgres
end
