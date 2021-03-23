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

_aster = Repo.insert!(%User{name: "Aster Martin", email: "", photo_hash: "", password_hash: ""})
_zoe = Repo.insert!(%User{name: "Zoe Tesla", email: "", photo_hash: "", password_hash: ""})
_day = Repo.insert!(%User{name: "Hyun-Woo Day", email: "", photo_hash: "", password_hash: ""})
_rose = Repo.insert!(%User{name: "Rose Smart", email: "", photo_hash: "", password_hash: ""})
