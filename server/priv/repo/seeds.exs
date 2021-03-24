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
alias EventsSpa.Photos

defmodule Inject do
  def photo(name) do
    photos = Application.app_dir(:events_spa, "priv/photos")
    path = Path.join(photos, name)
    {:ok, hash} = Photos.save_photo(name, path)
    hash
  end

  def user(name, pass, photo, email) do
    hash = Argon2.hash_pwd_salt(pass)
    Repo.insert!(%User{name: name, password_hash: hash, photo_hash: photo, email: email})
  end
end

hummingbird = Inject.photo("hummingbird.png")
hydra = Inject.photo("hydra.jpeg")
unicorn = Inject.photo("unicorn.jpg")

_aster = Inject.user("Aster", "Martin", hummingbird, "aster.martin@gmail.com")
_zoe = Inject.user("Zoe", "Tesla", hydra, "zoe.tesla@gmail.com")
_day = Inject.user("Hyun-Woo", "Day", hydra, "hyun-woo.day@gmail.com")
_rose = Inject.user("Rose", "Smart", unicorn, "rose.smart@gmail.com")
