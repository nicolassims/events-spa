# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     EventsSpa.Repo.insert!(%EventsSpa.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias EventsSpa.Repo
alias EventsSpa.Users.User

aster = Repo.insert!(%User{name: "Aster Martin", password_hash: ""})
zoe = Repo.insert!(%User{name: "Zoe Tesla", password_hash: ""})
day = Repo.insert!(%User{name: "Hyun-Woo Day", password_hash: ""})
rose = Repo.insert!(%User{name: "Rose Smart", password_hash: ""})
