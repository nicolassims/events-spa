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

defmodule Inject do
  def user(name, pass, email) do
    hash = Argon2.hash_pwd_salt(pass)
    Repo.insert!(%User{name: name, password_hash: hash, email: email})
  end
end

_aster = Inject.user("Aster", "Martin", "aster.martin@gmail.com")
_zoe = Inject.user("Zoe", "Tesla", "zoe.tesla@gmail.com")
_day = Inject.user("Hyun-Woo", "Day", "hyun-woo.day@gmail.com")
_rose = Inject.user("Rose", "Smart", "rose.smart@gmail.com")
