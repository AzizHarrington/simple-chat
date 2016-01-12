# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     SimpleChat.Repo.insert!(%SimpleChat.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

SimpleChat.Repo.insert!(%SimpleChat.Message{user_name: "bob", text: "hello"})
SimpleChat.Repo.insert!(%SimpleChat.Message{user_name: "joe", text: "whats up"})
SimpleChat.Repo.insert!(%SimpleChat.Message{user_name: "bob", text: "nothing"})
SimpleChat.Repo.insert!(%SimpleChat.Message{user_name: "joe", text: "i see"})
SimpleChat.Repo.insert!(%SimpleChat.Message{user_name: "sally", text: "whats going on"})
SimpleChat.Repo.insert!(%SimpleChat.Message{user_name: "joe", text: "just chatting"})
SimpleChat.Repo.insert!(%SimpleChat.Message{user_name: "bob", text: "im here"})
SimpleChat.Repo.insert!(%SimpleChat.Message{user_name: "bob", text: "eating a sandwhich"})
SimpleChat.Repo.insert!(%SimpleChat.Message{user_name: "sally", text: "good for you"})
SimpleChat.Repo.insert!(%SimpleChat.Message{user_name: "joe", text: "so interesting.."})
SimpleChat.Repo.insert!(%SimpleChat.Message{user_name: "joe", text: "what time is it?"})
SimpleChat.Repo.insert!(%SimpleChat.Message{user_name: "bob", text: "you know what time it is"})
SimpleChat.Repo.insert!(%SimpleChat.Message{user_name: "sally", text: "time to get a watch"})
