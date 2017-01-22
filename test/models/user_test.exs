defmodule Peepchat.UserTest do
  use Peepchat.ModelCase

  alias Peepchat.User

  @valid_attrs %{email: "ian.knauer@gmail.com", password: "abcde12345", password_confirmation: "abcde12345" }
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "mis-matched password_confirmation doesn't work" do
    changeset = User.changeset(%User{}, %{email: "ian.knauer@gmail.com", password: "abcde12345", password_confirmation: "12345abcde"})
    refute changeset.valid?
  end

  test "missing password_confirmation doesn't work" do
    changeset = User.changeset(%User{}, %{email: "ian.knauer@gmail.com", password: "abcdef123456"})
    refute changeset.valid?
  end

  test "short passwords don't work" do
    changeset = User.changeset(%User{}, %{email: "ian.knauer@gmail.com", password: "abcd1", password_confirmation: "abcd1"})
    refute changeset.valid?
  end
end
