# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     IpMajorProject.Repo.insert!(%IpMajorProject.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias IpMajorProject.{Profile, User}
alias IpMajorProject.Repo


user = %User{
username: "kat2000",
password: "peer",
}
Repo.insert! user

profile = Ecto.build_assoc(user, :profile, %{firstname: "kat",lastname: "hond",email: "hond.kat@hotmail.com",birthday: ~D[1999-03-17],comments: "hondkathondkat"})

Repo.insert! profile
